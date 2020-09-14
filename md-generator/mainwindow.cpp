#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QClipboard>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QObject::connect(ui->m_btnConvert, SIGNAL (released()),this, SLOT (handleConvert()));
    QObject::connect(ui->m_btnClear, SIGNAL (released()),this, SLOT (handleClear()));
    QObject::connect(ui->m_btnCopy, SIGNAL (released()),this, SLOT (handleCopy()));

}

void MainWindow::handleConvert()
{
    QString output = toMd(ui->inputText->toPlainText());
    ui->outputText->setPlainText(output);
}


void MainWindow::handleClear()
{
    ui->inputText->setPlainText("");
    ui->outputText->setPlainText("");
}


void MainWindow::handleCopy()
{
    QClipboard *clipboard = QApplication::clipboard();
    clipboard->setText(ui->outputText->toPlainText());
}




QString MainWindow::toMd(const QString & plainText) const
{

    QString res(plainText);


    res.replace("De :", "**De :**");
    res.replace("Envoyé :", "**Envoyé :**");
    res.replace("À :", "**À :**");
    res.replace("Cc :", "**Cc :**");
    res.replace("Objet :", "**Objet :**");
    res.replace("\n", "  \n");


    return  res;

}

MainWindow::~MainWindow()
{
    delete ui;
}

