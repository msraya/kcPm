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

from PyQt5 import QtCore, QtGui, QtWidgets

sqlplacesfields = [
	'id', 
	'shortname', 
	'fullname', 
	'building',
	'note'
]

# ---------------------------------------------------------
# ManufacturerDialog
# ---------------------------------------------------------

class PlacesDialog(QtWidgets.QDialog):
	def __init__(self, parent, title, shortname="", fullname="", www="", note=""):
		QtWidgets.QWidget.__init__(self, parent)
		self.setWindowTitle(title)
#		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtWidgets.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtWidgets.QHBoxLayout()
		self.shortnametext = QtWidgets.QLabel("Short name")
		self.form_layout1.addWidget(self.shortnametext)
		self.shortname = QtWidgets.QLineEdit(self) 
		self.shortname.setText(shortname)
		self.form_layout1.addWidget(self.shortname)
		self.layout.addLayout(self.form_layout1)			
		
		self.form_layout2 = QtWidgets.QHBoxLayout()
		self.fullnametext = QtWidgets.QLabel("Full name")
		self.form_layout2.addWidget(self.fullnametext)
		self.fullname = QtWidgets.QLineEdit(self) 
		self.fullname.setText(fullname)
		self.form_layout2.addWidget(self.fullname)
		self.layout.addLayout(self.form_layout2)

		self.form_layout3 = QtWidgets.QHBoxLayout()
		self.wwwtext = QtWidgets.QLabel("Building")
		self.form_layout3.addWidget(self.wwwtext)
		self.www = QtWidgets.QLineEdit(self) 
		self.www.setText(www)
		self.form_layout3.addWidget(self.www)
		self.layout.addLayout(self.form_layout3)					
				
		self.form_layout4 = QtWidgets.QHBoxLayout()
		self.notetext = QtWidgets.QLabel("Note")
		self.form_layout4.addWidget(self.notetext)
		self.note = QtWidgets.QPlainTextEdit(self) 
		self.note.setPlainText(note)
		self.form_layout4.addWidget(self.note)
		self.layout.addLayout(self.form_layout4)			

		self.button_layout = QtWidgets.QHBoxLayout()
		self.pb_ok = QtWidgets.QPushButton(self)
		self.pb_ok.setText("OK")
		self.button_layout.addWidget(self.pb_ok)
		self.pb_cancel = QtWidgets.QPushButton(self)
		self.pb_cancel.setText("Cancel")
		self.button_layout.addWidget(self.pb_cancel)
									
		self.layout.addLayout(self.button_layout)
				
		self.pb_ok.clicked.connect(self.ok_btn)
		self.pb_cancel.clicked.connect(self.cancel_btn)
		
	def ok_btn(self):
			self.accept()
								
	def cancel_btn(self):
		self.reject()
	
# ---------------------------------------------------------
# Manufacturers Frame
# ---------------------------------------------------------

class PlacesFrame(QtWidgets.QDialog):
	
	def keyPressEvent(self, event):
		if type(event) == QtWidgets.QKeyEvent:
			key = event.key()
			if key == 0x1000007:
				self.OnDelete()
			elif key == 0x100003b:
				self.OnAdd()				
			elif key == 0x1000006:
				self.OnAdd()
			event.accept()
		else:
			event.ignore()
				
	def __init__(self, parent, title):
		QtWidgets.QWidget.__init__(self, parent)
		self.setWindowTitle(title)
#		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtWidgets.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtWidgets.QVBoxLayout()
		self.placetext = QtWidgets.QLabel("Places")
		self.form_layout1.addWidget(self.placetext)		
		self.place_ctrl = QtWidgets.QTableWidget()
		self.place_ctrl.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)		
		self.place_ctrl.verticalHeader().setVisible(False)
		self.place_ctrl.horizontalHeader().setVisible(True)			
		self.place_ctrl.setRowCount(0)
		self.place_ctrl.setColumnCount(5)
		header=self.place_ctrl.horizontalHeader()
		header.hideSection(0)
		
		header.setSectionResizeMode(QtWidgets.QHeaderView.ResizeToContents)
		header.setSectionResizeMode(4,QtWidgets.QHeaderView.Stretch) 
		
#		header.setResizeMode(QtWidgets.QHeaderView.ResizeToContents)
#		header.setResizeMode(4,QtWidgets.QHeaderView.Stretch)		
		self.place_ctrl.setHorizontalHeaderLabels(["ID","Short name","Full name","WWW","Note"])		
		self.form_layout1.addWidget(self.place_ctrl)
		self.layout.addLayout(self.form_layout1)
		#self.mfgs_ctrl.itemClicked.connect(self.OnSelect)
		self.place_ctrl.itemDoubleClicked.connect(self.OnEdit)

		self.button_layout = QtWidgets.QHBoxLayout()
		self.pb_add = QtWidgets.QPushButton(self)
		self.pb_add.setText("Add")
		self.button_layout.addWidget(self.pb_add)
		self.pb_edit = QtWidgets.QPushButton(self)
		self.pb_edit.setText("Edit")
		self.button_layout.addWidget(self.pb_edit)
		self.pb_delete = QtWidgets.QPushButton(self)
		self.pb_delete.setText("Delete")
		self.button_layout.addWidget(self.pb_delete)
		self.pb_close = QtWidgets.QPushButton(self)
		self.pb_close.setText("Close")
		self.button_layout.addWidget(self.pb_close)
									
		self.layout.addLayout(self.button_layout)
				
		self.pb_add.clicked.connect(self.OnAdd)
		self.pb_edit.clicked.connect(self.OnEdit)
		self.pb_delete.clicked.connect(self.OnDelete)				
		self.pb_close.clicked.connect(self.OnClose)
		
		self.db = parent.db
		self.UpdatePlaces()
		self.selected_id = 0		
		
	def UpdatePlaces(self):
		places = self.db.Select('places', sqlplacesfields)
		i = 0
		self.place_ctrl.clear()
		self.place_ctrl.setRowCount(0)		
		self.place_ctrl.setHorizontalHeaderLabels(["ID","Short name","Full name","Building","Note"])		
		for place in places:
			self.place_ctrl.insertRow(i)
			item=QtWidgets.QTableWidgetItem(str(place[0]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.place_ctrl.setItem(i, 0, item)	
			item=QtWidgets.QTableWidgetItem(place[1])
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.place_ctrl.setItem(i, 1, item)		
			item=QtWidgets.QTableWidgetItem(place[2])
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.place_ctrl.setItem(i, 2, item)
			item=QtWidgets.QTableWidgetItem(place[3])
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.place_ctrl.setItem(i, 3, item)
			item=QtWidgets.QTableWidgetItem(place[4])
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.place_ctrl.setItem(i, 4, item)
			i+=1
				
	def OnAdd(self):
		newman = PlacesDialog(self, "New place")
		if newman.exec_() == QtWidgets.QDialog.Accepted:
			fields = {}
			fields['shortname'] =	newman.shortname.text()
			fields['fullname'] =	newman.fullname.text()
			fields['Building'] =	newman.www.text()
			fields['note'] =	newman.note.toPlainText()
			self.db.Insert('places', fields)
			self.UpdatePlaces()
		
		newman.close()
	
	def OnEdit(self):
		row = self.place_ctrl.currentRow()
		item=self.place_ctrl.item(row,0)
		self.selected_id = int(item.text())
		if self.selected_id == 0:
			return
		where = {}
		where['id'] = self.selected_id
		rows = self.db.Select('places', sqlplacesfields, where)
		fields = rows[0]
		editman = PlacesDialog(self, "Edit Places", fields[1], fields[2], fields[3], fields[4])
		if editman.exec_() == QtWidgets.QDialog.Accepted:
			fields = {}
			fields['shortname'] =	editman.shortname.text()
			fields['fullname'] =	editman.fullname.text()
			fields['Building'] =	editman.www.text()
			fields['note'] =	editman.note.toPlainText()
			self.db.Update('places', fields, where)
			self.UpdatePlaces()
		
		editman.close()
		
	def OnDelete(self):
		row = self.place_ctrl.currentRow()
		item=self.place_ctrl.item(row,0)
		self.selected_id = int(item.text())		
		if self.selected_id == 0:
			return
		dlg = QtWidgets.QMessageBox()
		dlg.setIcon(QtWidgets.QMessageBox.Question)
		dlg.setText("Are you sure to delete this place?")
		dlg.setWindowTitle("Delete place")
		dlg.setStandardButtons(QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
		if dlg.exec_() == QtWidgets.QMessageBox.Yes:
			where = {}
			where['id'] = self.selected_id
			self.db.Delete('places', where)
			self.UpdatePlaces()
		dlg.close()				
		
	def OnClose(self):
		self.close()				
