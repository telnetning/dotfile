#-*- coding: utf-8 -*- 
import os, sys, bsddb3

fileName = '/Users/telnetning/.vim/bundle/VimIM/plugin/vimim.gbk.bsddb'

def printError(ErrorType):
    if ErrorType == 1:
        print "Usage: addBsddbEntry.py key value"
    elif ErrorType == 2:
        print "Error: this value is alread exists."
    elif ErrorType == 3:
        print "Error: the db file not exists."
    elif ErrorType == 4:
        print "Error: key must contains letter only."
    else:
        print "Error: ErrorType is Wrong!"

    exit()

def openDb():
    if not os.path.isfile(fileName) or not os.path.exists(fileName) :
        printError(3)
    else:
        return bsddb3.btopen(fileName, 'c')


if __name__ == '__main__':
    if len(sys.argv) != 3:
        printError(1)
        
    if not sys.argv[1].isalpha():
        printError(4)

    db = openDb()
    
    try:
        originEntrys = db[sys.argv[1]]  #str
    except KeyError:
        originEntrys = ''
    
    newValue = unicode(sys.argv[2], 'utf8').encode('gb18030')
    
    for item in str.split(originEntrys):
        if item == newValue:
            printError(2)
            exit()

    newEntrys = newValue if (originEntrys == '') else newValue + ' ' +originEntrys 
    db[sys.argv[1]] = newEntrys

    db.sync()
    db.close()
