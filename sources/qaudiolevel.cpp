#include "qaudiolevel.h"
#include <QDebug>

QAudioLevel::QAudioLevel(): m_level(0.0)
{

}

void QAudioLevel::setLevel(qreal level)
{
    if (m_level != level) {
        m_level = level;
        qDebug() << m_level;
    }
}

