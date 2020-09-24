#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QClipboard>
#include <QTextStream>
#include <QIODevice>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QObject::connect(ui->m_btnConvert, SIGNAL (released()),this, SLOT (handleConvert()));
    QObject::connect(ui->m_btnClear, SIGNAL (released()),this, SLOT (handleClear()));
    QObject::connect(ui->m_btnCopy, SIGNAL (released()),this, SLOT (handleCopy()));
    QObject::connect(ui->m_btnTabConvert, SIGNAL (released()),this, SLOT (handleTabConvert()));

}

void MainWindow::handleConvert()
{
    QString output = toMd(ui->inputText->toPlainText());
    ui->outputText->setPlainText(output);
}


void MainWindow::handleTabConvert()
{
    QString output = tabToMd(ui->inputText->toPlainText());

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


    res.replace("De :", "----\n**De :**");
    res.replace("Envoyé :", "**Envoyé :**");
    res.replace("À :", "**À :**");
    res.replace("Cc :", "**Cc :**");
    res.replace("Objet :", "**Objet :**");
    res.replace("\n", "  \n");


    return  res;

}

QString MainWindow::tabToMd(const QString &plainText) const
{

    QString text(plainText);
    QTextStream str(&text, QIODevice::ReadOnly);
    QString line;
    QString res = "" ;


    int nbLine=0;
    do
    {
        QString endLine = "";
        line = str.readLine();

        if(line == "") continue;

        int nbCases = line.count('\t') + 1 ;
        line.replace("\t", "|");

        endLine = "|" + line + "|";
        if(nbLine==0)
        {
            endLine += "\n|";
            for(int iCase = 0; iCase < nbCases; iCase++)
            {
                endLine += "---- |";
            }
        }

        res += endLine + "\n";
        nbLine++;
    }
    while(!line.isNull());

    return  res;

}




MainWindow::~MainWindow()
{
    delete ui;
}

