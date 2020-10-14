#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();


public slots:
    void handleConvert();
    void handleTabConvert();
    void handleClear();
    void handleCopy();

private:
    Ui::MainWindow *ui;
    QString toMd(const QString & plainText) const;
    QString tabToMd(const QString & plainText) const;

};
#endif // MAINWINDOW_H
