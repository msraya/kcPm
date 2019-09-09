#!/usr/bin/env python

#   Copyright (C) 2016 by Mike Crash http://mikecrash.com/index.php?name=Content&pa=showpage&pid=10
#   Copyright (C) 2019 by Manuel Sanchez Raya
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

from PyQt5 import QtGui, QtWidgets, QtCore
import re

states = ['Unknown', 'Preliminary', 'In production', 'Not for new designs', 'Obsolete', 'Not working']


def elv2val(text):
	text=str(text)
	tokenized_input = []
	for token in re.split(r'(\d+(?:\.\d+)?)', text):
		token = token.strip()
		if re.match(r'\d+\.\d+', token):
			tokenized_input.append(float(token))
		elif token.isdigit():
			tokenized_input.append(int(token))
		elif token:
			tokenized_input.append(token)
	value = tokenized_input[0]
	if len(tokenized_input)>1:
		if tokenized_input[1]=='k':
			value *= 1000
		elif tokenized_input[1]=='M':
			value *= 1000000
		elif tokenized_input[1]=='p':
			value *= 1e-12
		elif tokenized_input[1]=='n':
			value *= 1e-9
		elif tokenized_input[1]=='u':
			value *= 1e-6
		elif tokenized_input[1]=='m':
			value *= 1e-3
	return value

def val2elv(value):
	value=str(value)
	#print(value)
	if value is None:
		return "0"
	value = float(value)
	app=''
	if abs(value)>=1e24:
		value = value/1e24
		app = 'Y'
	elif abs(value)>=1e21:
		value = value/1e21
		app = 'Z'
	elif abs(value)>=1e18:
		value = value/1e18
		app = 'E'
	elif abs(value)>=1e15:
		value = value/1e15
		app = 'P'
	elif abs(value)>=1e12:
		value = value/1e12
		app = 'T'
	elif abs(value)>=1e9:
		value = value/1e9
		app = 'G'
	elif abs(value)>=1e6:
		value = value/1e6
		app = 'M'
	elif abs(value)>=1e3:
		value = value/1e3
		app = 'k'
	elif abs(value)>=1:
		app = ''
	elif abs(value)>=1e-3:
		value = value*1e3
		app = 'm'
	elif abs(value)>=1e-6:
		value = value*1e6
		app = 'u'
	elif abs(value)>=1e-9:
		value = value*1e9
		app = 'n'
	elif abs(value)>=1e-12:
		value = value*1e12
		app = 'p'
	elif abs(value)>=1e-15:
		value = value*1e15
		app = 'f'
	elif abs(value)>=1e-18:
		value = value*1e18
		app = 'a'
	elif abs(value)>=1e-21:
		value = value*1e21
		app = 'z'
	elif abs(value)>=1e-24:
		value = value*1e24
		app = 'y'
	
	value2 = int(value)
	if float(value2)==value:
		value = value2
	res=str(value)+app
	return res
	
class CatID():
	def __init__(self, ids, value1name="", value2name="", value3name=""):
		self.id = ids
		self.value1name = value1name
		self.value2name = value2name
		self.value3name = value3name
	def ID(self):
		return self.id

def IndexOf(m_list,elem):
	#print elem
	index = None
	try:
			index = m_list.index(elem)
	except ValueError:
			return 0
	#print index
	return index			

class QHLine(QtWidgets.QFrame):
	def __init__(self):
		super(QHLine, self).__init__()
		self.setFrameShape(QtWidgets.QFrame.HLine)
		self.setFrameShadow(QtWidgets.QFrame.Sunken)

class QVLine(QtWidgets.QFrame):
	def __init__(self):
		super(QVLine, self).__init__()
		self.setFrameShape(QtWidgets.QFrame.VLine)
		self.setFrameShadow(QtWidgets.QFrame.Sunken)

def errordialog(texto):
	msg = QtWidgets.QMessageBox(QtWidgets.QMessageBox.Critical,"",texto)
	msg.setWindowFlags(QtCore.Qt.Dialog | QtCore.Qt.CustomizeWindowHint);
	msg.exec_()

def infodialog(texto):
	msg = QtWidgets.QMessageBox(QtWidgets.QMessageBox.Information,"",texto)
	msg.setWindowFlags(QtCore.Qt.Dialog | QtCore.Qt.CustomizeWindowHint);		
	msg.exec_()

def isfloat(value):
	try:
		float(value)
		return True
	except ValueError:
		return False