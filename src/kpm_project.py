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

from PyQt4 import QtCore, QtGui

sqlprofields = [
	'id', 
	'shortname', 
	'fullname', 
	'priority',
	'time',
	'note'
]

# ---------------------------------------------------------
# ManufacturerDialog
# ---------------------------------------------------------

class ProjectsDialog(QtGui.QDialog):
	def __init__(self, parent, title, shortname="", fullname="", priority="", time="", note=""):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)
#		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtGui.QHBoxLayout()
		self.shortnametext = QtGui.QLabel("Short name")
		self.form_layout1.addWidget(self.shortnametext)
		self.shortname = QtGui.QLineEdit(self) 
		self.shortname.setText(shortname)
		self.form_layout1.addWidget(self.shortname)
		self.layout.addLayout(self.form_layout1)			
		
		self.form_layout2 = QtGui.QHBoxLayout()
		self.fullnametext = QtGui.QLabel("Full name")
		self.form_layout2.addWidget(self.fullnametext)
		self.fullname = QtGui.QLineEdit(self) 
		self.fullname.setText(fullname)
		self.form_layout2.addWidget(self.fullname)
		self.layout.addLayout(self.form_layout2)

		self.form_layout3 = QtGui.QHBoxLayout()
		self.prioritytext = QtGui.QLabel("Priority")
		self.form_layout3.addWidget(self.prioritytext)
		self.priority = QtGui.QLineEdit(self) 
		self.priority.setText(priority)
		self.form_layout3.addWidget(self.priority)
		self.layout.addLayout(self.form_layout3)
		
		self.form_layout4 = QtGui.QHBoxLayout()
		self.timetext = QtGui.QLabel("time")
		self.form_layout4.addWidget(self.timetext)
		self.time = QtGui.QLineEdit(self) 
		self.time.setText(time)
		self.form_layout4.addWidget(self.time)
		self.layout.addLayout(self.form_layout4)					
				
		self.form_layout5 = QtGui.QHBoxLayout()
		self.notetext = QtGui.QLabel("Note")
		self.form_layout5.addWidget(self.notetext)
		self.note = QtGui.QPlainTextEdit(self) 
		self.note.setPlainText(note)
		self.form_layout5.addWidget(self.note)
		self.layout.addLayout(self.form_layout5)			

		self.button_layout = QtGui.QHBoxLayout()
		self.pb_ok = QtGui.QPushButton(self)
		self.pb_ok.setText("OK")
		self.button_layout.addWidget(self.pb_ok)
		self.pb_cancel = QtGui.QPushButton(self)
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

class ProjectsFrame(QtGui.QDialog):
	
	def keyPressEvent(self, event):
		if type(event) == QtGui.QKeyEvent:
			key = event.key()
			#print hex(key)
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
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)
#		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtGui.QVBoxLayout()
		self.protext = QtGui.QLabel("Projects")
		self.form_layout1.addWidget(self.protext)		
		self.pro_ctrl = QtGui.QTableWidget()
		self.pro_ctrl.setSelectionBehavior(QtGui.QAbstractItemView.SelectRows)		
		self.pro_ctrl.verticalHeader().setVisible(False)
		self.pro_ctrl.horizontalHeader().setVisible(True)			
		self.pro_ctrl.setRowCount(0)
		self.pro_ctrl.setColumnCount(6)
		header=self.pro_ctrl.horizontalHeader()
		header.hideSection(0)		
		header.setResizeMode(QtGui.QHeaderView.ResizeToContents)
		header.setResizeMode(5,QtGui.QHeaderView.Stretch)		
		self.pro_ctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Short name","Full name","Priority","Time Frame","Note"]))			
		self.form_layout1.addWidget(self.pro_ctrl)
		self.layout.addLayout(self.form_layout1)
		#self.mfgs_ctrl.itemClicked.connect(self.OnSelect)
		self.pro_ctrl.itemDoubleClicked.connect(self.OnEdit)

		self.button_layout = QtGui.QHBoxLayout()
		self.pb_add = QtGui.QPushButton(self)
		self.pb_add.setText("Add")
		self.button_layout.addWidget(self.pb_add)
		self.pb_edit = QtGui.QPushButton(self)
		self.pb_edit.setText("Edit")
		self.button_layout.addWidget(self.pb_edit)
		self.pb_delete = QtGui.QPushButton(self)
		self.pb_delete.setText("Delete")
		self.button_layout.addWidget(self.pb_delete)
		self.pb_close = QtGui.QPushButton(self)
		self.pb_close.setText("Close")
		self.button_layout.addWidget(self.pb_close)
									
		self.layout.addLayout(self.button_layout)
				
		self.pb_add.clicked.connect(self.OnAdd)
		self.pb_edit.clicked.connect(self.OnEdit)
		self.pb_delete.clicked.connect(self.OnDelete)				
		self.pb_close.clicked.connect(self.OnClose)
		
		self.db = parent.db
		self.UpdateProjects()
		self.selected_id = 0		
		
	def UpdateProjects(self):
		mfgs = self.db.Select('projects', sqlprofields)
		i = 0
		self.pro_ctrl.clear()
		self.pro_ctrl.setRowCount(0)		
		self.pro_ctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Short name","Full name","Priority","Time Frame","Note"]))		
		for mfg in mfgs:
			self.pro_ctrl.insertRow(i)
			item=QtGui.QTableWidgetItem(QtCore.QString(str(mfg[0])))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 0, item)	
			item=QtGui.QTableWidgetItem(QtCore.QString(mfg[1]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 1, item)		
			item=QtGui.QTableWidgetItem(QtCore.QString(mfg[2]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 2, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(mfg[3]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 3, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(mfg[4]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 4, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(mfg[5]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.pro_ctrl.setItem(i, 5, item)
			i+=1
				
	def OnAdd(self):
		newman = ProjectsDialog(self, "New project")
		if newman.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['shortname'] =	newman.shortname.text()
			fields['fullname'] =	newman.fullname.text()
			fields['priority'] =	newman.priority.text()
			fields['time'] =	newman.time.text()
			fields['note'] =	newman.note.toPlainText()
			self.db.Insert('projects', fields)
			self.UpdateProjects()
		
		newman.close()
	
	def OnEdit(self):
		row = self.pro_ctrl.currentRow()
		item=self.pro_ctrl.item(row,0)
		self.selected_id = int(item.text())
		if self.selected_id == 0:
			return
		where = {}
		where['id'] = self.selected_id
		rows = self.db.Select('projects', sqlprofields, where)
		fields = rows[0]
		editman = ProjectsDialog(self, "Edit project", fields[1], fields[2], fields[3], fields[4], fields[5])
		if editman.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['shortname'] =	editman.shortname.text()
			fields['fullname'] =	editman.fullname.text()
			fields['priority'] =	editman.priority.text()
			fields['time'] =	editman.time.text()
			fields['note'] =	editman.note.toPlainText()
			self.db.Update('projects', fields, where)
			self.UpdateManufacturers()
		
		editman.close()
		
	def OnDelete(self):
		row = self.pro_ctrl.currentRow()
		item=self.pro_ctrl.item(row,0)
		self.selected_id = int(item.text())		
		if self.selected_id == 0:
			return
		dlg = QtGui.QMessageBox()
		dlg.setIcon(QtGui.QMessageBox.Question)
		dlg.setText("Are you sure to delete this project?")
		dlg.setWindowTitle("Delete project")
		dlg.setStandardButtons(QtGui.QMessageBox.Yes | QtGui.QMessageBox.No)
		if dlg.exec_() == QtGui.QMessageBox.Yes:
			where = {}
			where['id'] = self.selected_id
			self.db.Delete('projects', where)
			self.UpdateProjects()
		dlg.close()			
		
	def OnClose(self):
		self.close()				
