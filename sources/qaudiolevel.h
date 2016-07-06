#ifndef QAUDIOLEVEL_H
#define QAUDIOLEVEL_H

#include <QtWidgets/QWidget>

class QAudioLevel
{

public:
    explicit QAudioLevel();

    // Using [0; 1.0] range
    void setLevel(qreal level);

private:
    qreal m_level;
};

#endif // QAUDIOLEVEL_H
