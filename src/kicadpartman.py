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

from PyQt5 import QtGui, QtCore, QtWidgets
import os
import sys
import ctypes

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


def resource_path(relative_path):
     if hasattr(sys, '_MEIPASS'):
         return os.path.join(sys._MEIPASS, relative_path)
     return os.path.join(os.path.abspath("."), relative_path)

# ---------------------------------------------------------
# CategoryDialog
# ---------------------------------------------------------

class CategoryDialog(QtWidgets.QDialog):
    def __init__(self, parent, title, shortname="", fullname="", value1="", value2="", value3="", description=""):
        QtWidgets.QWidget.__init__(self, parent)
        self.setWindowTitle(title)        
        self.setWindowModality(QtCore.Qt.ApplicationModal)
        #self.setGeometry(QtCore.QRect(100, 100, 250, 200))
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
        self.value1text = QtWidgets.QLabel("Value 1 name")
        self.form_layout3.addWidget(self.value1text)
        self.value1 = QtWidgets.QLineEdit(self) 
        self.value1.setText(value1)
        self.form_layout3.addWidget(self.value1)
        self.layout.addLayout(self.form_layout3)

        self.form_layout4 = QtWidgets.QHBoxLayout()
        self.value2text = QtWidgets.QLabel("Value 2 name")
        self.form_layout4.addWidget(self.value2text)
        self.value2 = QtWidgets.QLineEdit(self) 
        self.value2.setText(value2)
        self.form_layout4.addWidget(self.value2)
        self.layout.addLayout(self.form_layout4)


        self.form_layout5 = QtWidgets.QHBoxLayout()
        self.value3text = QtWidgets.QLabel("Value 3 name")
        self.form_layout5.addWidget(self.value3text)
        self.value3 = QtWidgets.QLineEdit(self) 
        self.value3.setText(value3)
        self.form_layout5.addWidget(self.value3)
        self.layout.addLayout(self.form_layout5)

        self.form_layout6 = QtWidgets.QHBoxLayout()
        self.descrtext = QtWidgets.QLabel("Description")
        self.form_layout6.addWidget(self.descrtext)
        self.description = QtWidgets.QPlainTextEdit(self) 
        self.description.setPlainText(description)
        self.form_layout6.addWidget(self.description)        
        self.layout.addLayout(self.form_layout6)
        
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
# PartDialog
# ---------------------------------------------------------

class PartDialog(QtWidgets.QDialog):
    def __init__(self, parent, title, value1name, value2name, value3name, partname="", partlabel="", component="", footprint="", value1="", value2="", value3="", rohs=0, smd=0, generic=0, state=0, description="", location="", size="",datasheet="", project=""):
        QtWidgets.QWidget.__init__(self, parent)
        self.setWindowTitle(title)        
        self.setWindowModality(QtCore.Qt.ApplicationModal)
        #self.setGeometry(QtCore.QRect(100, 100, 250, 200))
        self.layout = QtWidgets.QVBoxLayout()
        self.setLayout(self.layout)
        self.db = parent.db
        
        self.form_layout1 = QtWidgets.QHBoxLayout()
        self.partnametext = QtWidgets.QLabel("Part name (must be unique)")
        self.form_layout1.addWidget(self.partnametext)
        self.partname = QtWidgets.QLineEdit(self) 
        self.partname.setText(partname)
        self.form_layout1.addWidget(self.partname)
        self.layout.addLayout(self.form_layout1)
        
        self.form_layout2 = QtWidgets.QHBoxLayout()
        self.partlabeltext = QtWidgets.QLabel("Part label (value in KiCAD ~ Part name)")
        self.form_layout2.addWidget(self.partlabeltext)
        self.partlabel = QtWidgets.QLineEdit(self) 
        self.partlabel.setText(str(partlabel))
        self.form_layout2.addWidget(self.partlabel)
        self.layout.addLayout(self.form_layout2)
        
        self.form_layout3 = QtWidgets.QHBoxLayout()
        self.componenttext = QtWidgets.QLabel("Component (schematic symbol)")
        self.form_layout3.addWidget(self.componenttext)
        self.component = QtWidgets.QLineEdit(self) 
        self.component.setText(str(component))
        self.form_layout3.addWidget(self.component)
        self.layout.addLayout(self.form_layout3)

        self.form_layout4 = QtWidgets.QHBoxLayout()
        self.footprinttext = QtWidgets.QLabel("Footprint")
        self.form_layout4.addWidget(self.footprinttext)
        self.footprint = QtWidgets.QLineEdit(self) 
        self.footprint.setText(str(footprint))
        self.form_layout4.addWidget(self.footprint)
        self.layout.addLayout(self.form_layout4)

        self.form_layout5 = QtWidgets.QHBoxLayout()
        self.value1text = QtWidgets.QLabel(value1name)
        self.form_layout5.addWidget(self.value1text)
        self.value1 = QtWidgets.QLineEdit(self) 
        self.value1.setText(str(value1))
        self.form_layout5.addWidget(self.value1)
        self.layout.addLayout(self.form_layout5)
        
        self.form_layout6 = QtWidgets.QHBoxLayout()
        self.value2text = QtWidgets.QLabel(value2name)
        self.form_layout6.addWidget(self.value2text)
        self.value2 = QtWidgets.QLineEdit(self) 
        self.value2.setText(str(value2))
        self.form_layout6.addWidget(self.value2)
        self.layout.addLayout(self.form_layout6)        
        
        self.form_layout7 = QtWidgets.QHBoxLayout()
        self.value3text = QtWidgets.QLabel(value3name)
        self.form_layout7.addWidget(self.value3text)
        self.value3 = QtWidgets.QLineEdit(self) 
        self.value3.setText(str(value3))
        self.form_layout7.addWidget(self.value3)
        self.layout.addLayout(self.form_layout7)

        self.form_layout8 = QtWidgets.QHBoxLayout()
        self.smd = QtWidgets.QCheckBox("SMD")
        self.smd.setChecked(smd)
        self.form_layout8.addWidget(self.smd)
        self.layout.addLayout(self.form_layout8)        
        
        self.form_layout9 = QtWidgets.QHBoxLayout()
        self.rohs = QtWidgets.QCheckBox("RoHS")
        self.rohs.setChecked(rohs)
        self.form_layout9.addWidget(self.rohs)
        self.layout.addLayout(self.form_layout9)        
        
        self.form_layout10 = QtWidgets.QHBoxLayout()
        self.generic = QtWidgets.QCheckBox("Generic")
        self.generic.setChecked(generic)
        self.form_layout10.addWidget(self.generic)
        self.layout.addLayout(self.form_layout10)                
        
        self.form_layout11 = QtWidgets.QHBoxLayout()
        self.statetext = QtWidgets.QLabel("State")
        self.form_layout11.addWidget(self.statetext)
        self.StateCtrl = QtWidgets.QComboBox();
        self.StateCtrl.addItems(kpm_common.states)
        self.StateCtrl.setEditable(False)
        self.StateCtrl.setCurrentIndex(state)
        self.form_layout11.addWidget(self.StateCtrl)
        self.layout.addLayout(self.form_layout11)
        
        self.form_layout12 = QtWidgets.QHBoxLayout()
        self.locattext = QtWidgets.QLabel("Location")
        self.form_layout12.addWidget(self.locattext)        
        lista = self.db.GetLocationList()
        self.location = QtWidgets.QComboBox();
        self.location.addItems(lista)
        self.location.setEditable(False)
        self.location.setCurrentIndex(kpm_common.IndexOf(lista, location))        
        self.form_layout12.addWidget(self.location)
        self.layout.addLayout(self.form_layout12)                

        self.form_layout13 = QtWidgets.QHBoxLayout()
        self.sizetext = QtWidgets.QLabel("Size")
        self.form_layout13.addWidget(self.sizetext)
        self.size = QtWidgets.QLineEdit(self) 
        self.size.setText(str(size))
        self.form_layout13.addWidget(self.size)        
        self.layout.addLayout(self.form_layout13)
        
        self.form_layout14 = QtWidgets.QHBoxLayout()
        self.datastext = QtWidgets.QLabel("Datasheet")
        self.form_layout14.addWidget(self.datastext)
        self.datasheet = QtWidgets.QLineEdit(self) 
        self.datasheet.setText(str(datasheet))
        self.form_layout14.addWidget(self.datasheet)        
        self.layout.addLayout(self.form_layout14)        
        
        self.form_layout15 = QtWidgets.QHBoxLayout()
        self.projtext = QtWidgets.QLabel("Project")
        self.form_layout15.addWidget(self.projtext)        
        lista = self.db.GetProjectList()
        self.project = QtWidgets.QComboBox();
        self.project.addItems(lista)
        self.project.setEditable(False)
        self.project.setCurrentIndex(kpm_common.IndexOf(lista, project))        
        self.form_layout15.addWidget(self.project)
        self.layout.addLayout(self.form_layout15)        
        
        self.form_layout16 = QtWidgets.QHBoxLayout()
        self.descrtext = QtWidgets.QLabel("Description")
        self.form_layout16.addWidget(self.descrtext)
        self.description = QtWidgets.QPlainTextEdit(self) 
        self.description.setPlainText(description)
        self.form_layout16.addWidget(self.description)        
        self.layout.addLayout(self.form_layout16)
        
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
        if kpm_common.isfloat(self.value1.text()) and kpm_common.isfloat(self.value2.text()) and kpm_common.isfloat(self.value3.text()):
            self.accept()
        else:
            kpm_common.errordialog("Data entered is not numeric of empty")        
                                
    def cancel_btn(self):
        self.reject()
    
# ---------------------------------------------------------
# Main Frame
# ---------------------------------------------------------

class MainWindow(QtWidgets.QMainWindow):
    
    def setup_action(self, menu, label, tip, icon, shorcut, binde):
        Action = QtWidgets.QAction(QtGui.QIcon(icon), label, self)
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
        QtWidgets.QMainWindow.__init__(self, *args)
        #self.setGeometry(400, 180, 800, 400)
        self.apath=os.getenv('INSTDIR')
        if self.apath==None:
            self.apath=""
        else:
            self.apath= self.apath + "\\" 
        #kpm_common.infodialog("Apath:" + self.apath)                        
        self.setWindowTitle('KICAD Parts Manager')
        self.setWindowIcon(QtGui.QIcon(resource_path("main.png")))
        

        #         categories control        
        centralWidget = QtWidgets.QWidget()
        # Create a Layout for the central Widget
        self.hbox = QtWidgets.QHBoxLayout()    
        leftPanel = QtWidgets.QFrame()
        leftPanel.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.vlpbox = QtWidgets.QVBoxLayout()
        # Create Tree View
        self.cattext = QtWidgets.QLabel("Categories")
        self.vlpbox.addWidget(self.cattext)        
        self.cats_ctrl = QtWidgets.QTreeWidget(self)
        self.cats_ctrl.setHeaderHidden(True)
        self.vlpbox.addWidget(self.cats_ctrl)                
        leftPanel.setLayout(self.vlpbox)
        self.cats_ctrl.itemClicked.connect(self.OnCategory)
        self.cats_ctrl.itemDoubleClicked.connect(self.OnEditCategory)
            
        centralPanel = QtWidgets.QFrame()
        centralPanel.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.vcpbox = QtWidgets.QVBoxLayout()
        
        self.searchbox = QtWidgets.QHBoxLayout()        
        self.searchtext = QtWidgets.QLabel("Search: ")
        self.searchbox.addWidget(self.searchtext)

        self.searching = QtWidgets.QLineEdit(self) 
        self.searchbox.addWidget(self.searching)
        self.vcpbox.addLayout(self.searchbox)        
        
        self.searchbox2 = QtWidgets.QHBoxLayout()        
        
        self.onfieldtxt = QtWidgets.QLabel("on Field: ")
        self.searchbox2.addWidget(self.onfieldtxt)
        
        self.field = QtWidgets.QComboBox();
        self.field.addItems(searchfields)
        self.field.setEditable(False)
        self.searchbox2.addWidget(self.field)
        
        self.vcpbox.addLayout(self.searchbox2)
        self.searching.returnPressed.connect(self.OnSearch)                        
        
        #self.parttext = QtWidgets.QLabel("Parts")
        #self.vcpbox.addWidget(self.parttext)
        self.parts_ctrl = QtWidgets.QListWidget()
        self.parts_ctrl.itemClicked.connect(self.OnPart)                
        self.parts_ctrl.itemDoubleClicked.connect(self.OnEditPart)    
                
        self.vcpbox.addWidget(self.parts_ctrl)                
        centralPanel.setLayout(self.vcpbox)            
        
        #         properties list
        rightPanel = QtWidgets.QFrame()
        rightPanel.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.vrpbox = QtWidgets.QVBoxLayout()
        
        self.proptext = QtWidgets.QLabel("Properties")
        self.vrpbox.addWidget(self.proptext)
        self.prop_ctrl = QtWidgets.QTableWidget()        
        header=self.prop_ctrl.horizontalHeader()

        header.setSectionResizeMode(QtWidgets.QHeaderView.Stretch)
        header.setSectionResizeMode(0,QtWidgets.QHeaderView.ResizeToContents)                

        self.prop_ctrl.verticalHeader().setVisible(False)        
        self.prop_ctrl.horizontalHeader().setVisible(False)        
        self.prop_ctrl.setRowCount(0)
        self.prop_ctrl.setColumnCount(2)
        self.prop_ctrl.itemDoubleClicked.connect(self.OpenLink)                        
        self.vrpbox.addWidget(self.prop_ctrl)
        
        self.spartext = QtWidgets.QLabel("Purchases")
        self.vrpbox.addWidget(self.spartext)            
        self.flowctrl = QtWidgets.QTableWidget()
        self.flowctrl.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)        
        self.flowctrl.verticalHeader().setVisible(False)
        self.flowctrl.horizontalHeader().setVisible(True)            
        self.flowctrl.setRowCount(0)
        self.flowctrl.setColumnCount(9)
        header=self.flowctrl.horizontalHeader()
        header.hideSection(0)        
        header.setSectionResizeMode(QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(8,QtWidgets.QHeaderView.Stretch)        
        self.flowctrl.setHorizontalHeaderLabels(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"])            
        self.vrpbox.addWidget(self.flowctrl)
        self.flowctrl.itemDoubleClicked.connect(self.OnEditPurchase)            
                
        rightPanel.setLayout(self.vrpbox)                        
        centralPanel.setLayout(self.vcpbox)                            
        
        splitter = QtWidgets.QSplitter(QtCore.Qt.Horizontal)
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
        QtWidgets.QToolTip.setFont(QtGui.QFont('SansSerif', 10))        
        self.setToolTip('This is a <b>QWidget</b> Window widget')
        
        self.statusBar()    
        # Setting up the main menu
        menubar = self.menuBar()                                                                
        menubar.setToolTip('MenuBar')
        filemenu = menubar.addMenu('&File')
        partmanmenu = menubar.addMenu('&Manager')
        listsmenu = menubar.addMenu('&Lists')
        kicadmenu = menubar.addMenu('&KICAD')
        helpmenu =    menubar.addMenu('&Help')
        self.toolbar = self.addToolBar("")
        
        self.setup_action(filemenu,'&Exit','Exit/Terminate application',resource_path('exit.png'),'Ctrl+Q',self.close)
        self.setup_action(filemenu,'&Backup','Backup MySQL Database',resource_path('backup.png'),'Ctrl+B',self.OnBackup)        
        
#         # Part manager menu
        self.setup_action(partmanmenu,'Add &category','Add new subcategory to selected category',resource_path('add-cat.png'),'Ctrl+C',self.OnAddCategory)
        self.setup_action(partmanmenu,'Add &part','Add new part to selected category',resource_path('add-part.png'),'Ctrl+P',self.OnAddPart)                    
        partmanmenu.addSeparator()
        self.setup_action(partmanmenu,'Edit ca&tegory','Edit selected category',resource_path('edit-cat.png'),'Ctrl+F',self.OnEditCategory)                
        self.setup_action(partmanmenu,'Edit par&t','Edit selected part',resource_path('edit-part.png'),'Ctrl+E',self.OnEditPart)        
        partmanmenu.addSeparator()
        self.setup_action(partmanmenu,'Delete category','Delete selected category',resource_path('del-cat.png'),'Ctrl+E',self.OnDeleteCategory)                
        self.setup_action(partmanmenu,'Delete part','Delete selected part',resource_path('del-part.png'),'Ctrl+D',self.OnDeletePart)                
        # Lists menu
        self.setup_action(listsmenu,'&Receive part','Receive part to inventory',resource_path('receive-part.png'),'Ctrl+R',self.OnReceivePart)                
        self.setup_action(listsmenu,'R&eceive BOM','Receive BOM to inventory',resource_path('import-bom.png'),'Ctrl+B',self.OnReceiveBOM)        
        self.setup_action(listsmenu,'&Dispatch part','Dispatch part from inventory',resource_path('dispatch-part.png'),'Ctrl+D',self.OnDispatchPart)
        self.setup_action(listsmenu,'D&ispatch BOM','Dispatch BOM from inventory',resource_path('export-bom.png'),'Ctrl+G',self.OnDispatchBOM)        
        self.setup_action(listsmenu,'Stock &flow','View stock flow',resource_path('stock-flow.png'),'Ctrl+A',self.OnStockFlow)
        listsmenu.addSeparator()
        self.setup_action(listsmenu,'&Suppliers','List, add, edit and delete suppliers',resource_path('suppliers.png'),'Ctrl+S',self.OnSuppliers)        
        self.setup_action(listsmenu,'&BOMs','Bill of materials',resource_path('bom.png'),'Ctrl+M',self.OnBOMs)        
        self.setup_action(listsmenu,'&Places','List, add, edit and delete Storage Placement',resource_path('places.png'),'Ctrl+L',self.OnPlaces)        
        self.setup_action(listsmenu,'&Projects','List, add, edit and delete Projects',resource_path('projects.png'),'Ctrl+P',self.OnProjects)        
        # KiCAD menu
        self.setup_action(kicadmenu,'&Assign parts to schematic','Select schematic and assign parts to components',resource_path('assing.png'),'Ctrl+T',self.OnAssignParts)
        kicadmenu.addSeparator()
        self.setup_action(kicadmenu,'&Import BOM','Import BOM',resource_path('im-bom.png'),'Ctrl+I',self.OnImportBOM)
        # Help menu
        self.setup_action(helpmenu,'&About','About KiCAD Part Manager',resource_path('about.png'),'Ctrl+A',self.OnAbout)        

        # Init database
        try:
            self.db = kpm_db.Kpm_Db(kpm_config.sqlconfig)
        except:
            try:
                self.db = kpm_db.Kpm_Db(kpm_config.sqlconfig1)
            except:            
                kpm_common.errordialog("Database not Found")
                self.close()
                
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

    def OnAddCategory(self):
        if not self.cats_ctrl.hasFocus(): return        
        newcat = CategoryDialog(self, "New category")
        if newcat.exec_() == QtWidgets.QDialog.Accepted:
            fields = {}
            fields['parent'] =    self.selected_cat
            fields['shortname'] =    newcat.shortname.text()
            fields['fullname'] =    newcat.fullname.text()
            fields['value1'] =    newcat.value1.text()
            fields['value2'] =    newcat.value2.text()
            fields['value3'] =    newcat.value3.text()
            fields['description'] =    newcat.description.toPlainText()
            self.db.Insert('categories', fields)
            self.UpdateCategories()
        
        newcat.close()
    
    def OnEditCategory(self):
        if self.selected_cat == 0:
            return
        fields = self.db.GetCategory(self.selected_cat)
        editcat = CategoryDialog(self, "Edit category", fields[1], fields[2], fields[3], fields[4], fields[5], fields[6])
        if editcat.exec_() == QtWidgets.QDialog.Accepted:
            fields = {}
            fields['shortname'] =    editcat.shortname.text()
            fields['fullname'] =    editcat.fullname.text()
            fields['value1'] =    editcat.value1.text()
            fields['value2'] =    editcat.value2.text()
            fields['value3'] =    editcat.value3.text()
            fields['description'] =    editcat.description.toPlainText()
            where = {}
            where['id'] = self.selected_cat
            self.db.Update('categories', fields, where)
            self.UpdateCategories()
        
        editcat.close()

    def OnAddPart(self):
        if not self.parts_ctrl.hasFocus(): return        
        partdlg = PartDialog(self, "New part", self.value1name, self.value2name, self.value3name)
        if partdlg.exec_() == QtWidgets.QDialog.Accepted:
            fields = {}
            fields['category'] =    self.selected_cat
            fields['partname'] =    partdlg.partname.text()
            fields['partlabel'] =    partdlg.partlabel.text()
            fields['component'] =    partdlg.component.text()
            fields['footprint'] =    partdlg.footprint.text()
            
            fields['value1'] =    kpm_common.elv2val(partdlg.value1.text())
            fields['value2'] =    kpm_common.elv2val(partdlg.value2.text())
            fields['value3'] =    kpm_common.elv2val(partdlg.value3.text())
            
            fields['rohs'] =    partdlg.rohs.checkState()
            fields['smd'] =    partdlg.smd.checkState()
            fields['generic'] =    partdlg.generic.checkState()
            fields['state'] = partdlg.StateCtrl.currentIndex()
            fields['description'] =    partdlg.description.toPlainText()
            fields['location'] =    partdlg.location.currentText()
            fields['size'] =    partdlg.size.text()
            fields['datasheet'] =    partdlg.datasheet.text()
            fields['project'] =    partdlg.project.currentText()    
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
        if partdlg.exec_() == QtWidgets.QDialog.Accepted:
            fields = {}
            fields['category'] =    self.selected_cat
            fields['partname'] =    partdlg.partname.text()
            fields['partlabel'] =    partdlg.partlabel.text()
            fields['component'] =    partdlg.component.text()
            fields['footprint'] =    partdlg.footprint.text()
            fields['value1'] =    kpm_common.elv2val(partdlg.value1.text())
            fields['value2'] =    kpm_common.elv2val(partdlg.value2.text())
            fields['value3'] =    kpm_common.elv2val(partdlg.value3.text())
            fields['rohs'] =    partdlg.rohs.checkState()
            fields['smd'] =    partdlg.smd.checkState()
            fields['generic'] =    partdlg.generic.checkState()
            fields['state'] =    partdlg.StateCtrl.currentIndex()
            fields['description'] =    partdlg.description.toPlainText()
            fields['location'] =    partdlg.location.currentText()
            fields['size'] =    partdlg.size.text()
            fields['datasheet'] =    partdlg.datasheet.text()
            fields['project'] =    partdlg.project.currentText()                        
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
        
        dlg = QtWidgets.QMessageBox()
        dlg.setIcon(QtWidgets.QMessageBox.Question)
        dlg.setText("Are you sure to delete this category?")
        dlg.setWindowTitle("Delete category")
        dlg.setStandardButtons(QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if dlg.exec_() == QtWidgets.QMessageBox.Yes:
            where = {}
            where['id'] = self.selected_cat
            self.db.Delete('categories', where)
            self.UpdateCategories()
        dlg.close()

    def OnDeletePart(self):
        if not self.parts_ctrl.hasFocus(): return        
        if self.selected_part == 0:
            return
        dlg = QtWidgets.QMessageBox()
        dlg.setIcon(QtWidgets.QMessageBox.Question)
        dlg.setText("Are you sure to delete this part?")
        dlg.setWindowTitle("Delete part")
        dlg.setStandardButtons(QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if dlg.exec_() == QtWidgets.QMessageBox.Yes:        
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
        item =     self.flowctrl.item(row,0)
        where = {}
        where['id'] = str(item.text())
        rows = self.db.Select('flow', ['time','count','price','currency','partnumber','supplier','description'], where)
        row = rows[0]
        #print(row)    
        dlg = kpm_stock.StockReceiveDialog(self, "Edit purchase",row[0],row[1],row[2],row[3],row[4],row[5],row[6])
        if dlg.exec_()  == QtWidgets.QDialog.Accepted:
            fields = {}
            dateto = dlg.dateto.dateTime()            
            fields['time'] = str(dateto.toString(QtCore.Qt.ISODate))            
            fields['count'] =    int(dlg.countctrl.text())
            fields['price'] =    float(dlg.pricectrl.text())
            fields['currency'] =    str(dlg.currencyctrl.currentText())
            fields['partnumber'] =    str(dlg.partnumctrl.text())
            fields['supplier'] =    str(dlg.supplier.currentIndex())
            fields['description'] =    str(dlg.description.toPlainText())                    
            where = {}
            where['id'] = str(item.text())
            self.db.Update('flow', fields, where)
            self.UpdatePart(self.selected_part)
            self.UpdateStock(self.selected_part)            
            
        dlg.close()
    

    def OnReceivePart(self):
        if not self.flowctrl.hasFocus(): return            
        if self.selected_part == 0:
            return
        dlg = kpm_stock.StockReceiveDialog(self, "Receive part to inventory")
        if dlg.exec_()  == QtWidgets.QDialog.Accepted:
            dateto = dlg.dateto.dateTime()
            datep = str(dateto.toString(QtCore.Qt.ISODate))
            count = int(dlg.countctrl.text())
            price = float(dlg.pricectrl.text())
            currency = str(dlg.currencyctrl.currentText())
            partnumber = str(dlg.partnumctrl.text())
            supplier =    str(dlg.supplier.currentIndex())    
            description = str(dlg.description.toPlainText())
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
        if dlg.exec_() == QtWidgets.QDialog.Accepted:    
            count = -int(dlg.countctrl.text())
            description = str(dlg.description.toPlainText())            
            self.db.Stock(self.selected_part, count, description=description)
            self.UpdatePart(self.selected_part)
            self.UpdateStock(self.selected_part)            
            
        dlg.close()
        
    def OnDispatchBOM(self):
        kpm_common.infodialog("Not implemented")        
#         dlg = kpm_stock.BOMDispatchDialog(self, "Dispatch BOM from inventory")
#         if dlg.ShowModal() == wx.ID_OK:
#             bomid = dlg.bomid
#             count = -int(dlg.countctrl.GetValue())
#             description = dlg.description.GetValue()
#             where = {}
#             where['id'] = bomid
#             rows = self.db.Select('bom', kpm_bom.sqlbomfields, where)
#             fields = rows[0]
#             bom = kpm_bom.BOM()
#             bom.ParseCSV(fields[4])
#             partid = bom.bomfields.index('Part ID')
#             try:
#                 bomtypeid = bom.bomfields.index('BOMType')
#             except:
#                 bomtypeid = -1
#             for part in bom.bom:
#                 try:
#                     ids = int(part[partid])
#                 except:
#                     ids = 0
#                 if bomtypeid>0:
#                     bomtype = part[bomtypeid]
#                 else:
#                     bomtype = ''
#                 if (ids>0) & (bomtype==''):     # TODO make use of variants as NABC = NOT A,B,C
#                     self.db.Stock(ids, count, bom=bomid, description=description)
#             self.UpdatePart(self.selected_part)
        
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
#         if self.bomdlg is None:
#             self.bomdlg = kpm_bom.BOMFrame(self, "Bill of material")
#         self.bomdlg.Show()
        #bomdlg.Destroy()

    def OnAssignParts(self):
        kpm_common.infodialog("Not implemented")        
#         filedlg = wx.FileDialog(self, "Open schematic file", os.getcwd(), "", "*.sch", wx.OPEN)
#         if filedlg.ShowModal() == wx.ID_OK:
#             filename = filedlg.GetPath()
#             #filename = os.path.basename(path)
#             dlg = kpm_anno.AnnotateFrame(self, "Assign parts to schematic", filename)
#             dlg.ShowModal()
#             dlg.Destroy()
#         filedlg.Destroy()

    def OnImportBOM(self):
        kpm_common.infodialog("Not Implemented")

    def UpdateCategories(self):    
        cats = self.db.GetCategories(-1)
        self.cats_ctrl.clear();
        self.categories_count = 0
        self.categories = []
        for t in cats:
            if t[1] == 0:
                item = QtWidgets.QTreeWidgetItem(self.cats_ctrl,[str(t[2])])
            else:
                for cat in self.categories:
                    if cat[0] == t[1]:
                        item = QtWidgets.QTreeWidgetItem(cat[2],[str(t[2])])
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
        self.flowctrl.setHorizontalHeaderLabels(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"])            
        self.selected_part = 0
        self.selected_spare = 0
        i = 0
        for part in parts:
            item = QtWidgets.QListWidgetItem(part[1])                                        
            item.setData(QtCore.Qt.UserRole,int(part[0]))            
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
        self.flowctrl.setHorizontalHeaderLabels(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"])    
        self.selected_part = 0
        self.selected_spare = 0
        i = 0
        for part in parts:
            item = QtWidgets.QListWidgetItem(part[1])                                        
            item.setData(QtCore.Qt.UserRole,int(part[0]))            
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
                try:
                    fname = fname.decode()
                except AttributeError:
                    pass               
                item = QtWidgets.QTableWidgetItem(fname)
                item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )
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
                try:
                    value = value.decode()
                except AttributeError:
                    pass
                item = QtWidgets.QTableWidgetItem(str(value))
                item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                
                self.prop_ctrl.setItem(i-1, 1, item)
            i+=1
        where = {}
        where['id'] = part        
        rows = self.db.Select("stock", sqlstockfields, where)
        if len(rows)>0:
            prop = rows[0]
            self.prop_ctrl.insertRow(i-1)
            item = QtWidgets.QTableWidgetItem('In stock')
            item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                
            self.prop_ctrl.setItem(i-1, 0, item)
            item = QtWidgets.QTableWidgetItem(str(prop[1]))
            item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )            
            self.prop_ctrl.setItem(i-1, 1, item)
            i += 1
            if prop[2]!= 0:
                self.prop_ctrl.insertRow(i-1)
                item = QtWidgets.QTableWidgetItem('Price')
                item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )
                self.prop_ctrl.setItem(i-1, 0, item)
                item = QtWidgets.QTableWidgetItem(str(prop[2]) + ' ' + str(prop[3], 'utf-8'))
                item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                
                self.prop_ctrl.setItem(i-1, 1, item)

    def UpdateStock(self, part):
        #spares = self.db.GetSpares(part, sqlsparefields)
        where = {}
        where['id'] = part    
        where = "f.part = "+ str(part) + " ORDER BY f.id DESC"
        rows = self.db.GetStockFlow(kpm_stock.sqlflowfields, where)            
        self.flowctrl.clear()
        self.flowctrl.setRowCount(0)
        self.flowctrl.setHorizontalHeaderLabels(["ID","Date","Part","Change","Price","Currency","PartNumber","Supplier","Description"])
        i = 0
        for row in rows:
            #print row
            self.flowctrl.insertRow(i)
            item=QtWidgets.QTableWidgetItem(str(row[0]))
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )    
            self.flowctrl.setItem(i, 0, item)
            item=QtWidgets.QTableWidgetItem(row[8].strftime("%d-%m-%Y"))
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )                    
            self.flowctrl.setItem(i, 1, item)
            item=QtWidgets.QTableWidgetItem(row[1])
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )                    
            self.flowctrl.setItem(i, 2, item)
            item=QtWidgets.QTableWidgetItem(str(row[2]))
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )                    
            self.flowctrl.setItem(i, 3, item)
            item=QtWidgets.QTableWidgetItem(str(row[3]))
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )                                
            self.flowctrl.setItem(i, 4, item)
            item=QtWidgets.QTableWidgetItem(row[4])
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
            self.flowctrl.setItem(i, 5, item)
            item=QtWidgets.QTableWidgetItem(row[5])
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
            self.flowctrl.setItem(i, 6, item)
            item=QtWidgets.QTableWidgetItem(self.db.GetSupplierName(int(row[6])+1))
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
            self.flowctrl.setItem(i, 7, item)
            item=QtWidgets.QTableWidgetItem(row[7])
            item.setFlags( QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled )
            self.flowctrl.setItem(i, 8, item)            
            i+=1        
        
                                
#         i = 0
#         for spare in spares:
#             self.spare_ctrl.insertRow(i)
#             item=QtWidgets.QTableWidgetItem(QtCore.QString(str(spare[0])))
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                    
#             self.spare_ctrl.setItem(i, 0, item)
#             item=QtWidgets.QTableWidgetItem(QtCore.QString(spare[1]))
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                    
#             self.spare_ctrl.setItem(i, 1, item)
#             item=QtWidgets.QTableWidgetItem(QtCore.QString(spare[2]))
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                    
#             self.spare_ctrl.setItem(i, 2, item)
#             item=QtWidgets.QTableWidgetItem(QtCore.QString(spare[3]))
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                    
#             self.spare_ctrl.setItem(i, 3, item)
#             item=QtWidgets.QTableWidgetItem(kpm_common.states[spare[4]])
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )                                
#             self.spare_ctrl.setItem(i, 4, item)
#             item=QtWidgets.QTableWidgetItem(QtCore.QString(spare[5]))
#             item.setFlags( QtCore.Qt.ItemIsSelectable |    QtCore.Qt.ItemIsEnabled )
#             self.spare_ctrl.setItem(i, 5, item)
#             i+=1


    def OnDeleteStock(self):
        if not self.flowctrl.hasFocus(): return        
        dlg = QtWidgets.QMessageBox()
        dlg.setIcon(QtWidgets.QMessageBox.Question)
        dlg.setText("Are you sure to delete this purchase?")
        dlg.setWindowTitle("Delete purchase")
        dlg.setStandardButtons(QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No)
        if dlg.exec_() == QtWidgets.QMessageBox.Yes:
            row = self.flowctrl.currentRow()
            item =     self.flowctrl.item(row,0)
            where = {}
            where['id'] = str(item.text())
            rows = self.db.Select('flow', ['part','count'], where)
            row = rows[0]
            #print row            
            where = {}
            where['id'] = str(row[0])
            parts = self.db.Select('stock', ['count'], where)
            count = int(parts[0][0])
            #print count                    
            where = {}
            where['id'] = str(row[0])    
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
        #print(itemdata)
        #return
        #sel = itemdata.toPyObject()
        sel = itemdata
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
        self.selected_part = itemdata
        self.selected_spare = 0
        self.UpdatePart(self.selected_part)
        self.UpdateStock(self.selected_part)
        
    def OnBackup(self):
        fname = QtWidgets.QFileDialog.getSaveFileName(self, 'Save file',self.apath,"SQL files (*.sql)")
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

class App(QtWidgets.QApplication):
    def __init__(self, *args):
        QtWidgets.QApplication.__init__(self, *args)
        self.main = MainWindow()
 #       self.connect(self, QtCore.SIGNAL("lastWindowClosed()"), self.byebye )
        self.main.show()

 #   def byebye( self ):
 #       self.exit(0)

def main(args):
    global app
    app = App(args)
    app.exec_()

if __name__ == "__main__":
    myappid = 'mycompany.myproduct.subproduct.version' #arbitrary string
    ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)  
    main(sys.argv)