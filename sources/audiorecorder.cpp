#include <QAudioRecorder>
#include <QUrl>
#include <QAudioProbe>
#include "audiorecorder.h"
#include "qaudiolevel.h"
#include <QDebug>

AudioRecorder::AudioRecorder(QObject *parent) : QObject(parent)
{
    audioRecorder = new QAudioRecorder(this);
    QStringList inputs = audioRecorder->audioInputs();
    foreach (const QString &device, inputs) {
        QString description = audioRecorder->audioInputDescription(device);
           qDebug() << description ;

    }
    int useInput = 0;
    audioRecorder->setAudioInput(inputs[useInput]);
    qDebug() << "Using index " << useInput << ", name " << audioRecorder->audioInputDescription(inputs[useInput]);

   //ADDED BY ME
    QAudioProbe *probe = new QAudioProbe;

    // ... configure the audio recorder (skipped)

    connect(probe, SIGNAL(audioBufferProbed(QAudioBuffer)), this, SLOT(processBuffer(QAudioBuffer)));

    probe->setSource(audioRecorder); // Returns true, hopefully.



}

QStringList AudioRecorder::inputs() const
{
    QStringList inputs;
    foreach (const QString &device, audioRecorder->audioInputs()) {
        inputs.append(device);
    }
    return inputs;
}

QStringList AudioRecorder::codecs() const
{
    QStringList codecs;
    foreach (const QString &codecName, audioRecorder->supportedAudioCodecs()) {
        codecs.append(codecName);
    }
    return codecs;
}

QStringList AudioRecorder::containers() const
{
    QStringList containers;
    foreach (const QString &containerName, audioRecorder->supportedContainers()) {
        containers.append(containerName);
    }
    return containers;
}

QStringList AudioRecorder::sampleRates() const
{

}

QStringList AudioRecorder::channels() const
{

}

QString AudioRecorder::input() const
{

}

void AudioRecorder::setInput(QString input)
{

}

QString AudioRecorder::codec() const
{

}

void AudioRecorder::setCodec(QString codec)
{

}

QString AudioRecorder::container() const
{

}

void AudioRecorder::setContainer(QString container)
{

}

QString AudioRecorder::sampleRate() const
{

}

void AudioRecorder::setSampleRate(QString sampleRate)
{

}

QString AudioRecorder::channel() const
{

}

void AudioRecorder::setChannel(QString channel)
{

}

void AudioRecorder::record()
{
    if (audioRecorder->state() != QMediaRecorder::StoppedState) {
        stop();
    }

    qDebug() << "Start recording";

    QAudioEncoderSettings audioSettings;
    audioSettings.setCodec("audio/PCM");
    audioSettings.setSampleRate(48000);
    audioSettings.setBitRate(16);
    audioSettings.setChannelCount(2);
    //audioSettings.setQuality(QMultimedia::VeryHighQuality);
    //audioSettings.setEncodingMode(QMultimedia::ConstantQualityEncoding);

    audioRecorder->setEncodingSettings(audioSettings);
    audioRecorder->setContainerFormat("wav");


    audioRecorder->setOutputLocation(QUrl::fromLocalFile("test.wav"));
    audioRecorder->record();

}

void AudioRecorder::stop()
{
    qDebug() << "Stop recording";
    audioRecorder->stop();
}

void AudioRecorder::pause()
{

}

AudioRecorder::~AudioRecorder()
{
    delete audioRecorder;
}


void AudioRecorder::clearAudioLevels()
{
    for (int i = 0; i < audioLevels.size(); ++i)
        audioLevels.at(i)->setLevel(0);
}

// This function returns the maximum possible sample value for a given audio format
qreal getPeakValue(const QAudioFormat& format)
{
    // Note: Only the most common sample formats are supported
    if (!format.isValid())
        return qreal(0);

    if (format.codec() != "audio/pcm")
        return qreal(0);

    switch (format.sampleType()) {
    case QAudioFormat::Unknown:
        break;
    case QAudioFormat::Float:
        if (format.sampleSize() != 32) // other sample formats are not supported
            return qreal(0);
        return qreal(1.00003);
    case QAudioFormat::SignedInt:
        if (format.sampleSize() == 32)
            return qreal(INT_MAX);
        if (format.sampleSize() == 16)
            return qreal(SHRT_MAX);
        if (format.sampleSize() == 8)
            return qreal(CHAR_MAX);
        break;
    case QAudioFormat::UnSignedInt:
        if (format.sampleSize() == 32)
            return qreal(UINT_MAX);
        if (format.sampleSize() == 16)
            return qreal(USHRT_MAX);
        if (format.sampleSize() == 8)
            return qreal(UCHAR_MAX);
        break;
    }

    return qreal(0);
}

// returns the audio level for each channel
QVector<qreal> getBufferLevels(const QAudioBuffer& buffer)
{
    QVector<qreal> values;

    if (!buffer.format().isValid() || buffer.format().byteOrder() != QAudioFormat::LittleEndian)
        //qDebug() << "1" <<values;
        return values;

    if (buffer.format().codec() != "audio/pcm")
        // qDebug() << "2" << values;
        return values;

    int channelCount = buffer.format().channelCount();
    values.fill(0, channelCount);
    qreal peak_value = getPeakValue(buffer.format());
    if (qFuzzyCompare(peak_value, qreal(0)))
      //   qDebug() << "3" <<values;
        return values;

    switch (buffer.format().sampleType()) {
    case QAudioFormat::Unknown:
    case QAudioFormat::UnSignedInt:
        if (buffer.format().sampleSize() == 32)
            values = getBufferLevels(buffer.constData<quint32>(), buffer.frameCount(), channelCount);
        if (buffer.format().sampleSize() == 16)
            values = getBufferLevels(buffer.constData<quint16>(), buffer.frameCount(), channelCount);
        if (buffer.format().sampleSize() == 8)
            values = getBufferLevels(buffer.constData<quint8>(), buffer.frameCount(), channelCount);
        for (int i = 0; i < values.size(); ++i)
            values[i] = qAbs(values.at(i) - peak_value / 2) / (peak_value / 2);
        break;
    case QAudioFormat::Float:
        if (buffer.format().sampleSize() == 32) {
            values = getBufferLevels(buffer.constData<float>(), buffer.frameCount(), channelCount);
            for (int i = 0; i < values.size(); ++i)
                values[i] /= peak_value;
        }
        break;
    case QAudioFormat::SignedInt:
        if (buffer.format().sampleSize() == 32)
            values = getBufferLevels(buffer.constData<qint32>(), buffer.frameCount(), channelCount);
        if (buffer.format().sampleSize() == 16)
            values = getBufferLevels(buffer.constData<qint16>(), buffer.frameCount(), channelCount);
        if (buffer.format().sampleSize() == 8)
            values = getBufferLevels(buffer.constData<qint8>(), buffer.frameCount(), channelCount);
        for (int i = 0; i < values.size(); ++i)
            values[i] /= peak_value;
        break;
    }

    // qDebug() << "4" << values;
    return values;
}

template <class T>
QVector<qreal> getBufferLevels(const T *buffer, int frames, int channels)
{
    QVector<qreal> max_values;
    max_values.fill(0, channels);

    for (int i = 0; i < frames; ++i) {
        for (int j = 0; j < channels; ++j) {
            qreal value = qAbs(qreal(buffer[i * channels + j]));
            if (value > max_values.at(j))
                max_values.replace(j, value);
        }
    }
    // qDebug() << "5" <<max_values;
    return max_values;
}

void AudioRecorder::processBuffer(const QAudioBuffer& buffer)
{
    if (audioLevels.count() != buffer.format().channelCount()) {
        qDeleteAll(audioLevels);
        audioLevels.clear();
        for (int i = 0; i < buffer.format().channelCount(); ++i) {
            QAudioLevel *level = new QAudioLevel();
            audioLevels.append(level);
            qDebug() << "level" << level;


        }
    }

    QVector<qreal> levels = getBufferLevels(buffer);
    for (int i = 0; i < levels.count(); ++i)
        audioLevels.at(i)->setLevel(levels.at(i));
}
