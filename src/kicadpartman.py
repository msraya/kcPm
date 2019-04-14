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
import os
import sys

import kpm_config
import kpm_db
import kpm_common
import webbrowser
import kpm_sup
import kpm_place
import kpm_project
# import kpm_anno
# import kpm_bom
import kpm_stock

# para que solo salga el icono de esta aplicacion en barra
# import ctypes
# myappid = 'Manolo.GPIB.Plot_GPIB.V02' # arbitrary string
# ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)


currency = ['EUR', 'USD', 'CZK']

searchfields = [
	'partname', 	
	'partlabel', 
	'component', 
	'footprint', 	
	'state',
	'description',
	'location',
	'size',	
	'project'	
]

sqlpartfields = [
	'id', 
	'partname', 
	'partlabel', 
	'component', 
	'footprint', 
	'value1',
	'value2',
	'value3',
	'rohs',
	'smd',
	'generic',
	'state',
	'description',
	'location',
	'size',
	'datasheet',
	'project'
]

sqlpartfieldnames = [
	'ID', 
	'Part name', 
	'Part label', 
	'Component', 
	'Footprint', 
	'Value1',
	'Value2',
	'Value3',
	'RoHS',
	'SMD',
	'Generic',
	'State',
	'Description',
	'Location',
	'Size',
	'Datasheet',
	'Project'
]

sqlsparefields = [
	's.id', 
	's.partnumber', 
	'm.shortname', 
	'f.shortname',
	's.state',
	's.description'
]

sqlstockfields = [
	'id', 
	'count', 
	'price', 
	'currency'
]


# ---------------------------------------------------------
# CategoryDialog
# ---------------------------------------------------------

class CategoryDialog(QtGui.QDialog):
	def __init__(self, parent, title, shortname="", fullname="", value1="", value2="", value3="", description=""):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)		
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		#self.setGeometry(QtCore.QRect(100, 100, 250, 200))
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
		self.value1text = QtGui.QLabel("Value 1 name")
		self.form_layout3.addWidget(self.value1text)
		self.value1 = QtGui.QLineEdit(self) 
		self.value1.setText(value1)
		self.form_layout3.addWidget(self.value1)
		self.layout.addLayout(self.form_layout3)

		self.form_layout4 = QtGui.QHBoxLayout()
		self.value2text = QtGui.QLabel("Value 2 name")
		self.form_layout4.addWidget(self.value2text)
		self.value2 = QtGui.QLineEdit(self) 
		self.value2.setText(value2)
		self.form_layout4.addWidget(self.value2)
		self.layout.addLayout(self.form_layout4)


		self.form_layout5 = QtGui.QHBoxLayout()
		self.value3text = QtGui.QLabel("Value 3 name")
		self.form_layout5.addWidget(self.value3text)
		self.value3 = QtGui.QLineEdit(self) 
		self.value3.setText(value3)
		self.form_layout5.addWidget(self.value3)
		self.layout.addLayout(self.form_layout5)

		self.form_layout6 = QtGui.QHBoxLayout()
		self.descrtext = QtGui.QLabel("Description")
		self.form_layout6.addWidget(self.descrtext)
		self.description = QtGui.QPlainTextEdit(self) 
		self.description.setPlainText(description)
		self.form_layout6.addWidget(self.description)		
		self.layout.addLayout(self.form_layout6)
		
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
# PartDialog
# ---------------------------------------------------------

class PartDialog(QtGui.QDialog):
	def __init__(self, parent, title, value1name, value2name, value3name, partname="", partlabel="", component="", footprint="", value1="", value2="", value3="", rohs=0, smd=0, generic=0, state=0, description="", location="", size="",datasheet="", project=""):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)		
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		#self.setGeometry(QtCore.QRect(100, 100, 250, 200))
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)
		self.db = parent.db
		
		self.form_layout1 = QtGui.QHBoxLayout()
		self.partnametext = QtGui.QLabel("Part name (must be unique)")
		self.form_layout1.addWidget(self.partnametext)
		self.partname = QtGui.QLineEdit(self) 
		self.partname.setText(partname)
		self.form_layout1.addWidget(self.partname)
		self.layout.addLayout(self.form_layout1)
		
		self.form_layout2 = QtGui.QHBoxLayout()
		self.partlabeltext = QtGui.QLabel("Part label (value in KiCAD ~ Part name)")
		self.form_layout2.addWidget(self.partlabeltext)
		self.partlabel = QtGui.QLineEdit(self) 
		self.partlabel.setText(QtCore.QString(partlabel))
		self.form_layout2.addWidget(self.partlabel)
		self.layout.addLayout(self.form_layout2)
		
		self.form_layout3 = QtGui.QHBoxLayout()
		self.componenttext = QtGui.QLabel("Component (schematic symbol)")
		self.form_layout3.addWidget(self.componenttext)
		self.component = QtGui.QLineEdit(self) 
		self.component.setText(QtCore.QString(component))
		self.form_layout3.addWidget(self.component)
		self.layout.addLayout(self.form_layout3)

		self.form_layout4 = QtGui.QHBoxLayout()
		self.footprinttext = QtGui.QLabel("Footprint")
		self.form_layout4.addWidget(self.footprinttext)
		self.footprint = QtGui.QLineEdit(self) 
		self.footprint.setText(QtCore.QString(footprint))
		self.form_layout4.addWidget(self.footprint)
		self.layout.addLayout(self.form_layout4)

		self.form_layout5 = QtGui.QHBoxLayout()
		self.value1text = QtGui.QLabel(value1name)
		self.form_layout5.addWidget(self.value1text)
		self.value1 = QtGui.QLineEdit(self) 
		self.value1.setText(value1)
		self.form_layout5.addWidget(self.value1)
		self.layout.addLayout(self.form_layout5)
		
		self.form_layout6 = QtGui.QHBoxLayout()
		self.value2text = QtGui.QLabel(value2name)
		self.form_layout6.addWidget(self.value2text)
		self.value2 = QtGui.QLineEdit(self) 
		self.value2.setText(value2)
		self.form_layout6.addWidget(self.value2)
		self.layout.addLayout(self.form_layout6)		
		
		self.form_layout7 = QtGui.QHBoxLayout()
		self.value3text = QtGui.QLabel(value3name)
		self.form_layout7.addWidget(self.value3text)
		self.value3 = QtGui.QLineEdit(self) 
		self.value3.setText(value3)
		self.form_layout7.addWidget(self.value3)
		self.layout.addLayout(self.form_layout7)

		self.form_layout8 = QtGui.QHBoxLayout()
		self.smd = QtGui.QCheckBox("SMD")
		self.smd.setChecked(smd)
		self.form_layout8.addWidget(self.smd)
		self.layout.addLayout(self.form_layout8)		
		
		self.form_layout9 = QtGui.QHBoxLayout()
		self.rohs = QtGui.QCheckBox("RoHS")
		self.rohs.setChecked(rohs)
		self.form_layout9.addWidget(self.rohs)
		self.layout.addLayout(self.form_layout9)		
		
		self.form_layout10 = QtGui.QHBoxLayout()
		self.generic = QtGui.QCheckBox("Generic")
		self.generic.setChecked(generic)
		self.form_layout10.addWidget(self.generic)
		self.layout.addLayout(self.form_layout10)				
		
		self.form_layout11 = QtGui.QHBoxLayout()
		self.statetext = QtGui.QLabel("State")
		self.form_layout11.addWidget(self.statetext)
		self.StateCtrl = QtGui.QComboBox();
		self.StateCtrl.addItems(kpm_common.states)
		self.StateCtrl.setEditable(False)
		self.StateCtrl.setCurrentIndex(state)
		self.form_layout11.addWidget(self.StateCtrl)
		self.layout.addLayout(self.form_layout11)
		
		self.form_layout12 = QtGui.QHBoxLayout()
		self.locattext = QtGui.QLabel("Location")
		self.form_layout12.addWidget(self.locattext)		
		lista = self.db.GetLocationList()
		self.location = QtGui.QComboBox();
		self.location.addItems(lista)
		self.location.setEditable(False)
		self.location.setCurrentIndex(kpm_common.IndexOf(lista, location))		
		self.form_layout12.addWidget(self.location)
		self.layout.addLayout(self.form_layout12)				

		self.form_layout13 = QtGui.QHBoxLayout()
		self.sizetext = QtGui.QLabel("Size")
		self.form_layout13.addWidget(self.sizetext)
		self.size = QtGui.QLineEdit(self) 
		self.size.setText(size)
		self.form_layout13.addWidget(self.size)		
		self.layout.addLayout(self.form_layout13)
		
		self.form_layout14 = QtGui.QHBoxLayout()
		self.datastext = QtGui.QLabel("Datasheet")
		self.form_layout14.addWidget(self.datastext)
		self.datasheet = QtGui.QLineEdit(self) 
		self.datasheet.setText(datasheet)
		self.form_layout14.addWidget(self.datasheet)		
		self.layout.addLayout(self.form_layout14)		
		
		self.form_layout15 = QtGui.QHBoxLayout()
		self.projtext = QtGui.QLabel("Project")
		self.form_layout15.addWidget(self.projtext)		
		lista = self.db.GetProjectList()
		self.project = QtGui.QComboBox();
		self.project.addItems(lista)
		self.project.setEditable(False)
		self.project.setCurrentIndex(kpm_common.IndexOf(lista, project))		
		self.form_layout15.addWidget(self.project)
		self.layout.addLayout(self.form_layout15)		
		
		self.form_layout16 = QtGui.QHBoxLayout()
		self.descrtext = QtGui.QLabel("Description")
		self.form_layout16.addWidget(self.descrtext)
		self.description = QtGui.QPlainTextEdit(self) 
		self.description.setPlainText(description)
		self.form_layout16.addWidget(self.description)		
		self.layout.addLayout(self.form_layout16)
		
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
		if kpm_common.isfloat(self.value1.text()) and kpm_common.isfloat(self.value2.text()) and kpm_common.isfloat(self.value3.text()):
			self.accept()
		else:
			kpm_common.errordialog("Data entered is not numeric of empty")		
								
	def cancel_btn(self):
		self.reject()
	
# ---------------------------------------------------------
# Main Frame
# ---------------------------------------------------------

class MainWindow(QtGui.QMainWindow):
	
	def setup_action(self, menu, label, tip, icon, shorcut, binde):
		Action = QtGui.QAction(QtGui.QIcon(icon), label, self)
		Action.setShortcut(shorcut)												
		Action.setStatusTip(tip)
		Action.triggered.connect(binde)
		menu.addAction(Action)
		self.toolbar.addAction(Action);
		#return Action	

	def keyPressEvent(self, event):
		if type(event) == QtGui.QKeyEvent:
			key = event.key()
			if key == 0x1000007:
				self.OnDeleteCategory()
				self.OnDeletePart()
				self.OnDeleteStock()
			elif key == 0x100003b:
				self.OnAddCategory()
				self.OnAddPart()
				self.OnReceivePart()
			elif key == 0x1000006:
				self.OnAddCategory()
				self.OnAddPart()
				self.OnReceivePart()		
						
			event.accept()
		else:
			event.ignore()	
	
	def __init__(self, *args):
		QtGui.QMainWindow.__init__(self, *args)
		#self.setGeometry(400, 180, 800, 400)										
		self.setWindowTitle('KICAD Parts Manager')
		self.setWindowIcon(QtGui.QIcon("main.png"))
		
		self.apath=os.getenv('INSTDIR')
		if self.apath==None:
				self.apath=""
		#		 categories control		
		centralWidget = QtGui.QWidget()
		# Create a Layout for the central Widget
		self.hbox = QtGui.QHBoxLayout()	
		leftPanel = QtGui.QFrame()
		leftPanel.setFrameShape(QtGui.QFrame.StyledPanel)
		self.vlpbox = QtGui.QVBoxLayout()
		# Create Tree View
		self.cattext = QtGui.QLabel("Categories")
		self.vlpbox.addWidget(self.cattext)		
		self.cats_ctrl = QtGui.QTreeWidget(self)
		self.cats_ctrl.setHeaderHidden(True)
		self.vlpbox.addWidget(self.cats_ctrl)				
		leftPanel.setLayout(self.vlpbox)
		self.cats_ctrl.itemClicked.connect(self.OnCategory)
		self.cats_ctrl.itemDoubleClicked.connect(self.OnEditCategory)
			
		centralPanel = QtGui.QFrame()
		centralPanel.setFrameShape(QtGui.QFrame.StyledPanel)
		self.vcpbox = QtGui.QVBoxLayout()
		
		self.searchbox = QtGui.QHBoxLayout()		
		self.searchtext = QtGui.QLabel("Search: ")
		self.searchbox.addWidget(self.searchtext)

		self.searching = QtGui.QLineEdit(self) 
		self.searchbox.addWidget(self.searching)
		self.vcpbox.addLayout(self.searchbox)		
		
		self.searchbox2 = QtGui.QHBoxLayout()		
		
		self.onfieldtxt = QtGui.QLabel("on Field: ")
		self.searchbox2.addWidget(self.onfieldtxt)
		
		self.field = QtGui.QComboBox();
		self.field.addItems(searchfields)
		self.field.setEditable(False)
		self.searchbox2.addWidget(self.field)
		
		self.vcpbox.addLayout(self.searchbox2)
		self.searching.returnPressed.connect(self.OnSearch)						
		
		#self.parttext = QtGui.QLabel("Parts")
		#self.vcpbox.addWidget(self.parttext)
		self.parts_ctrl = QtGui.QListWidget()
		self.parts_ctrl.itemClicked.connect(self.OnPart)				
		self.parts_ctrl.itemDoubleClicked.connect(self.OnEditPart)	
				
		self.vcpbox.addWidget(self.parts_ctrl)				
		centralPanel.setLayout(self.vcpbox)			
		
		#		 properties list
		rightPanel = QtGui.QFrame()
		rightPanel.setFrameShape(QtGui.QFrame.StyledPanel)
		self.vrpbox = QtGui.QVBoxLayout()
		
		self.proptext = QtGui.QLabel("Properties")
		self.vrpbox.addWidget(self.proptext)
		self.prop_ctrl = QtGui.QTableWidget()		
		header=self.prop_ctrl.horizontalHeader()

		header.setResizeMode(QtGui.QHeaderView.Stretch)
		header.setResizeMode(0,QtGui.QHeaderView.ResizeToContents)				

		self.prop_ctrl.verticalHeader().setVisible(False)		
		self.prop_ctrl.horizontalHeader().setVisible(False)		
		self.prop_ctrl.setRowCount(0)
		self.prop_ctrl.setColumnCount(2)
		self.prop_ctrl.itemDoubleClicked.connect(self.OpenLink)						
		self.vrpbox.addWidget(self.prop_ctrl)
		
		self.spartext = QtGui.QLabel("Purchases")
		self.vrpbox.addWidget(self.spartext)			
		self.flowctrl = QtGui.QTableWidget()
		self.flowctrl.setSelectionBehavior(QtGui.QAbstractItemView.SelectRows)		
		self.flowctrl.verticalHeader().setVisible(False)
		self.flowctrl.horizontalHeader().setVisible(True)			
		self.flowctrl.setRowCount(0)
		self.flowctrl.setColumnCount(9)
		header=self.flowctrl.horizontalHeader()
		header.hideSection(0)		
		header.setResizeMode(QtGui.QHeaderView.ResizeToContents)
		header.setResizeMode(8,QtGui.QHeaderView.Stretch)		
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"]))			
		self.vrpbox.addWidget(self.flowctrl)
		self.flowctrl.itemDoubleClicked.connect(self.OnEditPurchase)			
				
		rightPanel.setLayout(self.vrpbox)						
		centralPanel.setLayout(self.vcpbox)							
		
		splitter = QtGui.QSplitter(QtCore.Qt.Horizontal)
		splitter.addWidget(leftPanel)
		splitter.addWidget(centralPanel)
		splitter.addWidget(rightPanel)
		splitter.setSizes([150,200,300])
		
		self.hbox.addWidget(splitter)
		# Set the Layout
		centralWidget.setLayout(self.hbox)
		# Set the Widget
		self.setCentralWidget(centralWidget)		 

		# ToolTips				
		QtGui.QToolTip.setFont(QtGui.QFont('SansSerif', 10))		
		self.setToolTip('This is a <b>QWidget</b> Window widget')
		
		self.statusBar()	
		# Setting up the main menu
		menubar = self.menuBar()																
		menubar.setToolTip('MenuBar')
		filemenu = menubar.addMenu('&File')
		partmanmenu = menubar.addMenu('&Manager')
		listsmenu = menubar.addMenu('&Lists')
		kicadmenu = menubar.addMenu('&KICAD')
		helpmenu =	menubar.addMenu('&Help')
		self.toolbar = self.addToolBar("")
		
		self.setup_action(filemenu,'&Exit','Exit/Terminate application','exit.png','Ctrl+Q',self.OnExit)
		self.setup_action(filemenu,'&Backup','Backup MySQL Database','backup.png','Ctrl+B',self.OnBackup)		
		
#		 # Part manager menu
		self.setup_action(partmanmenu,'Add &category','Add new subcategory to selected category','add-cat.png','Ctrl+C',self.OnAddCategory)
		self.setup_action(partmanmenu,'Add &part','Add new part to selected category','add-part.png','Ctrl+P',self.OnAddPart)					
		partmanmenu.addSeparator()
		self.setup_action(partmanmenu,'Edit ca&tegory','Edit selected category','edit-cat.png','Ctrl+F',self.OnEditCategory)				
		self.setup_action(partmanmenu,'Edit par&t','Edit selected part','edit-part.png','Ctrl+E',self.OnEditPart)		
		partmanmenu.addSeparator()
		self.setup_action(partmanmenu,'Delete category','Delete selected category','del-cat.png','Ctrl+E',self.OnDeleteCategory)				
		self.setup_action(partmanmenu,'Delete part','Delete selected part','del-part.png','Ctrl+D',self.OnDeletePart)				
		# Lists menu
		self.setup_action(listsmenu,'&Receive part','Receive part to inventory','receive-part.png','Ctrl+R',self.OnReceivePart)				
		self.setup_action(listsmenu,'R&eceive BOM','Receive BOM to inventory','import-bom.png','Ctrl+B',self.OnReceiveBOM)		
		self.setup_action(listsmenu,'&Dispatch part','Dispatch part from inventory','dispatch-part.png','Ctrl+D',self.OnDispatchPart)
		self.setup_action(listsmenu,'D&ispatch BOM','Dispatch BOM from inventory','export-bom.png','Ctrl+G',self.OnDispatchBOM)		
		self.setup_action(listsmenu,'Stock &flow','View stock flow','stock-flow.png','Ctrl+A',self.OnStockFlow)
		listsmenu.addSeparator()
		self.setup_action(listsmenu,'&Suppliers','List, add, edit and delete suppliers','suppliers.png','Ctrl+S',self.OnSuppliers)		
		self.setup_action(listsmenu,'&BOMs','Bill of materials','bom.png','Ctrl+M',self.OnBOMs)		
		self.setup_action(listsmenu,'&Places','List, add, edit and delete Storage Placement','places.png','Ctrl+L',self.OnPlaces)		
		self.setup_action(listsmenu,'&Projects','List, add, edit and delete Projects','projects.png','Ctrl+P',self.OnProjects)		
		# KiCAD menu
		self.setup_action(kicadmenu,'&Assign parts to schematic','Select schematic and assign parts to components','assing.png','Ctrl+T',self.OnAssignParts)
		kicadmenu.addSeparator()
		self.setup_action(kicadmenu,'&Import BOM','Import BOM','im-bom.png','Ctrl+I',self.OnImportBOM)
		# Help menu
		self.setup_action(helpmenu,'&About','About KiCAD Part Manager','about.png','Ctrl+A',self.OnAbout)		

		# Init database
		try:
			self.db = kpm_db.Kpm_Db(kpm_config.sqlconfig)
		except:
			try:
				self.db = kpm_db.Kpm_Db(kpm_config.sqlconfig1)
			except:			
				kpm_common.errordialog("Database not Found")
				self.OnExit()
				
		self.categories = []

		# Show window			
		self.show()
		self.UpdateCategories()
		
		# Init variables
		self.selected_cat = 0
		self.selected_part = 0
		self.selected_spare = 0
		self.num_parts = 0
		
		self.value1name="value1"
		self.value2name="value2"
		self.value3name="value3"
		
		# Init dialogs
		self.mfgdlg = None
		self.supdlg = None
		self.bomdlg = None
		self.plcdlg = None
		self.prodlg = None

	def OpenLink(self,item):
		if item.column() == 1:
			if item.row() == 14:
				webbrowser.open(str(item.text()))

	def OnAbout(self):
		# A message dialog box with an OK button. wx.OK is a standard ID in wxWidgets.
		kpm_common.infodialog("KiCAD Part Manager\n\nProgrammed by Mike Crash and Manuel Sanchez 2019\n\nLicensed by GNU GPL v3");

	def OnExit(self):
		sys.exit()	# Close the frame.

	def OnAddCategory(self):
		if not self.cats_ctrl.hasFocus(): return		
		newcat = CategoryDialog(self, "New category")
		if newcat.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['parent'] =	self.selected_cat
			fields['shortname'] =	newcat.shortname.text()
			fields['fullname'] =	newcat.fullname.text()
			fields['value1'] =	newcat.value1.text()
			fields['value2'] =	newcat.value2.text()
			fields['value3'] =	newcat.value3.text()
			fields['description'] =	newcat.description.toPlainText()
			self.db.Insert('categories', fields)
			self.UpdateCategories()
		
		newcat.close()
	
	def OnEditCategory(self):
		if self.selected_cat == 0:
			return
		fields = self.db.GetCategory(self.selected_cat)
		editcat = CategoryDialog(self, "Edit category", fields[1], fields[2], fields[3], fields[4], fields[5], fields[6])
		if editcat.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['shortname'] =	editcat.shortname.text()
			fields['fullname'] =	editcat.fullname.text()
			fields['value1'] =	editcat.value1.text()
			fields['value2'] =	editcat.value2.text()
			fields['value3'] =	editcat.value3.text()
			fields['description'] =	editcat.description.toPlainText()
			where = {}
			where['id'] = self.selected_cat
			self.db.Update('categories', fields, where)
			self.UpdateCategories()
		
		editcat.close()

	def OnAddPart(self):
		if not self.parts_ctrl.hasFocus(): return		
		partdlg = PartDialog(self, "New part", self.value1name, self.value2name, self.value3name)
		if partdlg.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['category'] =	self.selected_cat
			fields['partname'] =	partdlg.partname.text()
			fields['partlabel'] =	partdlg.partlabel.text()
			fields['component'] =	partdlg.component.text()
			fields['footprint'] =	partdlg.footprint.text()
			
			fields['value1'] =	kpm_common.elv2val(partdlg.value1.text())
			fields['value2'] =	kpm_common.elv2val(partdlg.value2.text())
			fields['value3'] =	kpm_common.elv2val(partdlg.value3.text())
			
			fields['rohs'] =	partdlg.rohs.checkState()
			fields['smd'] =	partdlg.smd.checkState()
			fields['generic'] =	partdlg.generic.checkState()
			fields['state'] = partdlg.StateCtrl.currentIndex()
			fields['description'] =	partdlg.description.toPlainText()
			fields['location'] =	partdlg.location.currentText()
			fields['size'] =	partdlg.size.text()
			fields['datasheet'] =	partdlg.datasheet.text()
			fields['project'] =	partdlg.project.currentText()	
			self.db.Insert('parts', fields)
			self.UpdateParts(self.selected_cat)
		
		partdlg.close()

	def OnEditPart(self):
		if self.selected_part == 0:
			return
		where = {}
		where['id'] = self.selected_part
		cat = self.db.Select("parts", ['category'], where)
		where = {}
		where['id'] = str(cat[0][0])
		values = self.db.Select("categories", ['value1','value2','value3'], where)
		val=values[0]			
		where = {}
		where['id'] = self.selected_part
		rows = self.db.Select('parts', sqlpartfields, where)
		fields = rows[0]		
		partdlg = PartDialog(self, "Edit part", val[0], val[1], val[2], fields[1], fields[2], fields[3], fields[4], kpm_common.val2elv(fields[5]), kpm_common.val2elv(fields[6]), kpm_common.val2elv(fields[7]), fields[8], fields[9], fields[10], fields[11], fields[12], fields[13], fields[14], fields[15], fields[16])
		if partdlg.exec_() == QtGui.QDialog.Accepted:
			fields = {}
			fields['category'] =	self.selected_cat
			fields['partname'] =	partdlg.partname.text()
			fields['partlabel'] =	partdlg.partlabel.text()
			fields['component'] =	partdlg.component.text()
			fields['footprint'] =	partdlg.footprint.text()
			fields['value1'] =	kpm_common.elv2val(partdlg.value1.text())
			fields['value2'] =	kpm_common.elv2val(partdlg.value2.text())
			fields['value3'] =	kpm_common.elv2val(partdlg.value3.text())
			fields['rohs'] =	partdlg.rohs.checkState()
			fields['smd'] =	partdlg.smd.checkState()
			fields['generic'] =	partdlg.generic.checkState()
			fields['state'] =	partdlg.StateCtrl.currentIndex()
			fields['description'] =	partdlg.description.toPlainText()
			fields['location'] =	partdlg.location.currentText()
			fields['size'] =	partdlg.size.text()
			fields['datasheet'] =	partdlg.datasheet.text()
			fields['project'] =	partdlg.project.currentText()						
			where = {}
			where['id'] = self.selected_part
			self.db.Update('parts', fields, where)
			self.UpdatePart(self.selected_part)
		
		partdlg.close()

	def OnDeleteCategory(self):
		if not self.cats_ctrl.hasFocus(): return		
		if self.selected_cat == 0:
			return
		if self.num_parts != 0:
			kpm_common.errordialog("Category must be empty to delete it.")
			return
		
		dlg = QtGui.QMessageBox()
		dlg.setIcon(QtGui.QMessageBox.Question)
		dlg.setText("Are you sure to delete this category?")
		dlg.setWindowTitle("Delete category")
		dlg.setStandardButtons(QtGui.QMessageBox.Yes | QtGui.QMessageBox.No)
		if dlg.exec_() == QtGui.QMessageBox.Yes:
			where = {}
			where['id'] = self.selected_cat
			self.db.Delete('categories', where)
			self.UpdateCategories()
		dlg.close()

	def OnDeletePart(self):
		if not self.parts_ctrl.hasFocus(): return		
		if self.selected_part == 0:
			return
		dlg = QtGui.QMessageBox()
		dlg.setIcon(QtGui.QMessageBox.Question)
		dlg.setText("Are you sure to delete this part?")
		dlg.setWindowTitle("Delete part")
		dlg.setStandardButtons(QtGui.QMessageBox.Yes | QtGui.QMessageBox.No)
		if dlg.exec_() == QtGui.QMessageBox.Yes:		
			where = {}
			where['id'] = self.selected_part
			self.db.Delete('parts', where)
			#where = {}
			#where['partid'] = self.selected_part
			#self.db.Delete('spares', where)
			self.UpdateParts(self.selected_cat)
		dlg.close()


	def OnEditPurchase(self):
		if not self.flowctrl.hasFocus(): return			
		if self.selected_part == 0:
			return
		row = self.flowctrl.currentRow()
		item = 	self.flowctrl.item(row,0)
		where = {}
		where['id'] = unicode(item.text())
		rows = self.db.Select('flow', ['time','count','price','currency','partnumber','supplier','description'], where)
		row = rows[0]
		#print row	
		dlg = kpm_stock.StockReceiveDialog(self, "Edit purchase",row[0],row[1],row[2],row[3],row[4],row[5],row[6])
		if dlg.exec_()  == QtGui.QDialog.Accepted:
			fields = {}
			dateto = dlg.dateto.dateTime()			
			fields['time'] = unicode(dateto.toString(QtCore.Qt.ISODate))			
			fields['count'] =	int(dlg.countctrl.text())
			fields['price'] =	float(dlg.pricectrl.text())
			fields['currency'] =	unicode(dlg.currencyctrl.currentText())
			fields['partnumber'] =	unicode(dlg.partnumctrl.text())
			fields['supplier'] =	unicode(dlg.supplier.currentIndex())
			fields['description'] =	unicode(dlg.description.toPlainText())					
			where = {}
			where['id'] = unicode(item.text())
			self.db.Update('flow', fields, where)
			self.UpdatePart(self.selected_part)
			self.UpdateStock(self.selected_part)			
			
		dlg.close()
	

	def OnReceivePart(self):
		if not self.flowctrl.hasFocus(): return			
		if self.selected_part == 0:
			return
		dlg = kpm_stock.StockReceiveDialog(self, "Receive part to inventory")
		if dlg.exec_()  == QtGui.QDialog.Accepted:
			dateto = dlg.dateto.dateTime()
			datep = unicode(dateto.toString(QtCore.Qt.ISODate))
			count = int(dlg.countctrl.text())
			price = float(dlg.pricectrl.text())
			currency = unicode(dlg.currencyctrl.currentText())
			partnumber = unicode(dlg.partnumctrl.text())
			supplier =	unicode(dlg.supplier.currentIndex())	
			description = unicode(dlg.description.toPlainText())
			self.db.Stock(self.selected_part, count, datep, price, currency, partnumber, supplier, description=description)
			self.UpdatePart(self.selected_part)
			self.UpdateStock(self.selected_part)
			
		dlg.close()
		
	def OnReceiveBOM(self):
		kpm_common.infodialog("Not implemented")
		
	def OnDispatchPart(self):
		if self.selected_part == 0:
			return
		dlg = kpm_stock.StockDispatchDialog(self, "Dispatch part from inventory")
		if dlg.exec_() == QtGui.QDialog.Accepted:	
			count = -int(dlg.countctrl.text())
			description = unicode(dlg.description.toPlainText())			
			self.db.Stock(self.selected_part, count, description=description)
			self.UpdatePart(self.selected_part)
			self.UpdateStock(self.selected_part)			
			
		dlg.close()
		
	def OnDispatchBOM(self):
		kpm_common.infodialog("Not implemented")		
#		 dlg = kpm_stock.BOMDispatchDialog(self, "Dispatch BOM from inventory")
#		 if dlg.ShowModal() == wx.ID_OK:
#			 bomid = dlg.bomid
#			 count = -int(dlg.countctrl.GetValue())
#			 description = dlg.description.GetValue()
#			 where = {}
#			 where['id'] = bomid
#			 rows = self.db.Select('bom', kpm_bom.sqlbomfields, where)
#			 fields = rows[0]
#			 bom = kpm_bom.BOM()
#			 bom.ParseCSV(fields[4])
#			 partid = bom.bomfields.index('Part ID')
#			 try:
#				 bomtypeid = bom.bomfields.index('BOMType')
#			 except:
#				 bomtypeid = -1
#			 for part in bom.bom:
#				 try:
#					 ids = int(part[partid])
#				 except:
#					 ids = 0
#				 if bomtypeid>0:
#					 bomtype = part[bomtypeid]
#				 else:
#					 bomtype = ''
#				 if (ids>0) & (bomtype==''):	 # TODO make use of variants as NABC = NOT A,B,C
#					 self.db.Stock(ids, count, bom=bomid, description=description)
#			 self.UpdatePart(self.selected_part)
		
	def OnStockFlow(self):	
		dlg = kpm_stock.StockFlow(self)
		dlg.exec_()
		dlg.close()


	def OnSuppliers(self):
		if self.supdlg is None:
			self.supdlg = kpm_sup.SuppliersFrame(self, "Suppliers")
		self.supdlg.show()
		#supdlg.Destroy()
		
	def OnPlaces(self):
		if self.plcdlg is None:
			self.plcdlg = kpm_place.PlacesFrame(self, "Places")
		self.plcdlg.show()
		#mfgdlg.close()

	def OnProjects(self):	
		if self.prodlg is None:
			self.prodlg = kpm_project.ProjectsFrame(self, "Projects")
		self.prodlg.show()
		#supdlg.Destroy()		

	def OnBOMs(self):
		kpm_common.infodialog("Not implemented")		
#		 if self.bomdlg is None:
#			 self.bomdlg = kpm_bom.BOMFrame(self, "Bill of material")
#		 self.bomdlg.Show()
		#bomdlg.Destroy()

	def OnAssignParts(self):
		kpm_common.infodialog("Not implemented")		
#		 filedlg = wx.FileDialog(self, "Open schematic file", os.getcwd(), "", "*.sch", wx.OPEN)
#		 if filedlg.ShowModal() == wx.ID_OK:
#			 filename = filedlg.GetPath()
#			 #filename = os.path.basename(path)
#			 dlg = kpm_anno.AnnotateFrame(self, "Assign parts to schematic", filename)
#			 dlg.ShowModal()
#			 dlg.Destroy()
#		 filedlg.Destroy()

	def OnImportBOM(self):
		kpm_common.infodialog("Not Implemented")

	def UpdateCategories(self):	
		cats = self.db.GetCategories(-1)
		self.cats_ctrl.clear();
		self.categories_count = 0
		self.categories = []
		for t in cats:
			if t[1] == 0:
				item = QtGui.QTreeWidgetItem(self.cats_ctrl,[str(t[2])])
			else:
				for cat in self.categories:
					if cat[0] == t[1]:
						item = QtGui.QTreeWidgetItem(cat[2],[str(t[2])])
						break
			sel = kpm_common.CatID(t[0], t[3], t[4], t[5])
			
			#TODO check item if exists
			if item != None:
				item.setData(1,QtCore.Qt.UserRole,sel)
				#QtCore.QVariant(sel))
				self.categories.append([t[0], t[1], item])

		self.cats_ctrl.expandAll()

	def OnSearch(self):
		parts = self.db.SearchParts(self.field.currentText(), self.searching.text())
		self.prop_ctrl.clear()
		self.prop_ctrl.setRowCount(0)		
		self.parts_ctrl.clear()		
		self.flowctrl.clear()
		self.flowctrl.setRowCount(0)
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"]))			
		self.selected_part = 0
		self.selected_spare = 0
		i = 0
		for part in parts:
			item = QtGui. QListWidgetItem(QtCore.QString(part[1]))										
			item.setData(QtCore.Qt.UserRole,long(part[0]))			
			self.parts_ctrl.insertItem(i, item)
			i+=1
		self.num_parts = i	


	def UpdateParts(self,category):
		parts = self.db.GetParts(category)
		self.parts_ctrl.clear()		
		self.prop_ctrl.clear()
		self.prop_ctrl.setRowCount(0)		
		self.flowctrl.clear()
		self.flowctrl.setRowCount(0)
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"]))	
		self.selected_part = 0
		self.selected_spare = 0
		i = 0
		for part in parts:
			item = QtGui. QListWidgetItem(QtCore.QString(part[1]))										
			item.setData(QtCore.Qt.UserRole,long(part[0]))			
			self.parts_ctrl.insertItem(i, item)
			i+=1
		self.num_parts = i

	def UpdatePart(self, part):
		where = {}
		where['id'] = part
		rows = self.db.Select("parts", sqlpartfields, where)
		prop = rows[0]
		self.prop_ctrl.clear()
		self.prop_ctrl.setRowCount(0)
		where = {}
		where['id'] = part
		cat = self.db.Select("parts", ['category'], where)
		where = {}
		where['id'] = str(cat[0][0])
		values = self.db.Select("categories", ['value1','value2','value3'], where)
		val=values[0]	
		i = 0
		for p in prop:
			if i==5:
				fname = val[0]
			elif i==6:
				fname = val[1]
			elif i==7:
				fname = val[2]
			else:
				fname = sqlpartfieldnames[i]
			if i != 0:
				self.prop_ctrl.insertRow(i-1)
				item = QtGui.QTableWidgetItem(fname)
				item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )
				self.prop_ctrl.setItem(i-1, 0, item)
			if (i >= 5) & (i<=7):
				value = kpm_common.val2elv(p)
			elif (i >= 8) & (i<=10):
				if p == 0:
					value = "No"
				else:
					value = "Yes"			
			elif (i == 11):
				value = kpm_common.states[p]
			else:
				value = p
			if i != 0:
				item = QtGui.QTableWidgetItem(QtCore.QString(value))
				item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )				
				self.prop_ctrl.setItem(i-1, 1, item)
			i+=1
		where = {}
		where['id'] = part		
		rows = self.db.Select("stock", sqlstockfields, where)
		if len(rows)>0:
			prop = rows[0]
			self.prop_ctrl.insertRow(i-1)
			item = QtGui.QTableWidgetItem('In stock')
			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )				
			self.prop_ctrl.setItem(i-1, 0, item)
			item = QtGui.QTableWidgetItem(QtCore.QString(str(prop[1])))
			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )			
			self.prop_ctrl.setItem(i-1, 1, item)
			i += 1
			if prop[2]!= 0:
				self.prop_ctrl.insertRow(i-1)
				item = QtGui.QTableWidgetItem('Price')
				item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )
				self.prop_ctrl.setItem(i-1, 0, item)
				item = QtGui.QTableWidgetItem(QtCore.QString(str(prop[2])+' '+prop[3]))
				item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )				
				self.prop_ctrl.setItem(i-1, 1, item)

	def UpdateStock(self, part):
		#spares = self.db.GetSpares(part, sqlsparefields)
		where = {}
		where['id'] = part	
		where = "f.part = "+ str(part) + " ORDER BY f.id DESC"
		rows = self.db.GetStockFlow(kpm_stock.sqlflowfields, where)			
		self.flowctrl.clear()
		self.flowctrl.setRowCount(0)
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"]))
		i = 0
		for row in rows:
			#print row
			self.flowctrl.insertRow(i)
			item=QtGui.QTableWidgetItem(QtCore.QString(str(row[0])))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )	
			self.flowctrl.setItem(i, 0, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(row[8].strftime("%d-%m-%Y")))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )					
			self.flowctrl.setItem(i, 1, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(row[1]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )					
			self.flowctrl.setItem(i, 2, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(str(row[2])))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )					
			self.flowctrl.setItem(i, 3, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(str(row[3])))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )								
			self.flowctrl.setItem(i, 4, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(row[4]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
			self.flowctrl.setItem(i, 5, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(row[5]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
			self.flowctrl.setItem(i, 6, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(self.db.GetSupplierName(int(row[6])+1)))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
			self.flowctrl.setItem(i, 7, item)
			item=QtGui.QTableWidgetItem(QtCore.QString(row[7]))
			item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
			self.flowctrl.setItem(i, 8, item)			
			i+=1		
		
								
# 		i = 0
# 		for spare in spares:
# 			self.spare_ctrl.insertRow(i)
# 			item=QtGui.QTableWidgetItem(QtCore.QString(str(spare[0])))
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )					
# 			self.spare_ctrl.setItem(i, 0, item)
# 			item=QtGui.QTableWidgetItem(QtCore.QString(spare[1]))
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )					
# 			self.spare_ctrl.setItem(i, 1, item)
# 			item=QtGui.QTableWidgetItem(QtCore.QString(spare[2]))
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )					
# 			self.spare_ctrl.setItem(i, 2, item)
# 			item=QtGui.QTableWidgetItem(QtCore.QString(spare[3]))
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )					
# 			self.spare_ctrl.setItem(i, 3, item)
# 			item=QtGui.QTableWidgetItem(kpm_common.states[spare[4]])
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )								
# 			self.spare_ctrl.setItem(i, 4, item)
# 			item=QtGui.QTableWidgetItem(QtCore.QString(spare[5]))
# 			item.setFlags( QtCore.Qt.ItemIsSelectable |	QtCore.Qt.ItemIsEnabled )
# 			self.spare_ctrl.setItem(i, 5, item)
# 			i+=1


	def OnDeleteStock(self):
		if not self.flowctrl.hasFocus(): return		
		dlg = QtGui.QMessageBox()
		dlg.setIcon(QtGui.QMessageBox.Question)
		dlg.setText("Are you sure to delete this purchase?")
		dlg.setWindowTitle("Delete purchase")
		dlg.setStandardButtons(QtGui.QMessageBox.Yes | QtGui.QMessageBox.No)
		if dlg.exec_() == QtGui.QMessageBox.Yes:
			row = self.flowctrl.currentRow()
			item = 	self.flowctrl.item(row,0)
			where = {}
			where['id'] = unicode(item.text())
			rows = self.db.Select('flow', ['part','count'], where)
			row = rows[0]
			#print row			
			where = {}
			where['id'] = unicode(row[0])
			parts = self.db.Select('stock', ['count'], where)
			count = int(parts[0][0])
			#print count					
			where = {}
			where['id'] = unicode(row[0])	
			count-= int(row[1])	
			fields = {}
			fields['count'] = count
			self.db.Update('stock', fields, where)
			where = {}
			where['id'] = item.text()			
			self.db.Delete('flow', where)
			self.UpdatePart(self.selected_part)
			self.UpdateStock(self.selected_part)
		dlg.close()	

	def OnCategory(self, event):
		if event == None:
			return
		itemdata = event.data(1,QtCore.Qt.UserRole)
		if itemdata == None:
			return
		sel = itemdata.toPyObject()
		if sel==None: return
		self.selected_cat = sel.ID()
		self.value1name = sel.value1name
		self.value2name = sel.value2name
		self.value3name = sel.value3name
		self.UpdateParts(self.selected_cat)

	def OnPart(self, event):
		item = event
		if item == None:
			return
		itemdata = item.data(QtCore.Qt.UserRole)
		if itemdata == None:
			return
		self.selected_part = itemdata.toPyObject()
		self.selected_spare = 0
		self.UpdatePart(self.selected_part)
		self.UpdateStock(self.selected_part)
		
	def OnBackup(self):
		fname = QtGui.QFileDialog.getSaveFileName(self, 'Save file',self.apath,"SQL files (*.sql)")
		#print fname				
		if not fname.isEmpty():
			cur = self.db.cnx.cursor(buffered=True)
			cur.execute("SHOW TABLES")
			data = ""
			tables = []
			for table in cur.fetchall():
				tables.append(table[0])
			
			for table in tables:
					#print table
					data += "DROP TABLE IF EXISTS `" + str(table) + "`;"
			
					cur.execute("SHOW CREATE TABLE `" + str(table) + "`;")
					data += "\n" + str(cur.fetchone()[1]) + ";\n\n"
			
					cur.execute("SELECT * FROM `" + str(table) + "`;")
					self.db.cnx.commit()					
					for row in cur.fetchall():
							data += "INSERT INTO `" + str(table) + "` VALUES("
							first = True
							for field in row:
									if not first:
											data += ', '
									try:
										tmp = str(field)
									except Exception:
										tmp = field.encode('utf-8')
									#print tmp
									data += '"' + tmp + '"'
									first = False
							data += ");\n"
					data += "\n\n"	
			cur.close()							
			FILE = open(fname,"w")
			FILE.writelines(data)
			FILE.close()		

class App(QtGui.QApplication):
	def __init__(self, *args):
		QtGui.QApplication.__init__(self, *args)
		self.main = MainWindow()
		self.connect(self, QtCore.SIGNAL("lastWindowClosed()"), self.byebye )
		self.main.show()

	def byebye( self ):
		self.exit(0)

def main(args):
	global app
	app = App(args)
	app.exec_()

if __name__ == "__main__":
	main(sys.argv)