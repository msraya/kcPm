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
import kpm_config
import kpm_db
import kpm_common
from PyQt4.Qt import QString

currencylst = ['EUR', 'USD', 'CZK']

sqlbomfields = [
	'id', 
	'name', 
	'version'
]

sqlstockfields = [
	'id', 
	'count', 
	'price', 
	'currency'
]

sqlflowfields = [
	'f.id',
	'p.partname',
	'f.count',
	'f.price',
	'f.currency',
	'f.partnumber',
	'f.supplier',	
	'f.description',
	'f.time'
]

# ---------------------------------------------------------
# StockReceiveDialog
# ---------------------------------------------------------

class StockReceiveDialog(QtGui.QDialog):
	def __init__(self, parent, title, date="", count="", price="", currency="", partnumber="", supplier="", description=""):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)
		self.db = parent.db
		
		self.form_layout1 = QtGui.QHBoxLayout()
		self.totext = QtGui.QLabel("Date")
		self.form_layout1.addWidget(self.totext)
		t = QtCore.QDate().currentDate()
		self.dateto = QtGui.QDateEdit(self)
		self.dateto.setDisplayFormat('dd-MM-yyyy')
		self.dateto.setCalendarPopup(True)
		#print date
		if date == "": self.dateto.setDate(t)
		else: self.dateto.setDateTime(QtCore.QDateTime.fromString(QString(str(date)),"yyyy-MM-dd HH:mm:ss"))	
		#self.countctrl.setText(shortname)
		self.form_layout1.addWidget(self.dateto)
		self.layout.addLayout(self.form_layout1)
							

		self.form_layout2 = QtGui.QHBoxLayout()
		self.counttext = QtGui.QLabel("Count")
		self.form_layout2.addWidget(self.counttext)
		self.countctrl = QtGui.QLineEdit(self) 
		self.countctrl.setText(QString(str(count)))
		self.form_layout2.addWidget(self.countctrl)
		self.layout.addLayout(self.form_layout2)		
		
		self.form_layout3 = QtGui.QHBoxLayout()
		self.pricetext = QtGui.QLabel("Price")
		self.form_layout3.addWidget(self.pricetext)
		self.pricectrl = QtGui.QLineEdit(self) 
		self.pricectrl.setText(QString(str(price)))
		self.form_layout3.addWidget(self.pricectrl)
		self.layout.addLayout(self.form_layout3)
		
		self.form_layout4 = QtGui.QHBoxLayout()
		self.currtext = QtGui.QLabel("Currency")
		self.form_layout4.addWidget(self.currtext)
		self.currencyctrl = QtGui.QComboBox();
		self.currencyctrl.addItems(currencylst)
		self.currencyctrl.setEditable(False)
		self.currencyctrl.setCurrentIndex(kpm_common.IndexOf(currencylst, currency))		
		self.form_layout4.addWidget(self.currencyctrl)
		self.layout.addLayout(self.form_layout4)

		self.form_layout5 = QtGui.QHBoxLayout()
		self.partnumbertext = QtGui.QLabel("Part Number")
		self.form_layout5.addWidget(self.partnumbertext)
		self.partnumctrl = QtGui.QLineEdit(self) 
		self.partnumctrl.setText(partnumber)		
		self.form_layout5.addWidget(self.partnumctrl)
		self.layout.addLayout(self.form_layout5)		
		
		self.form_layout6 = QtGui.QHBoxLayout()
		self.suppliertext = QtGui.QLabel("Supplier")
		self.form_layout6.addWidget(self.suppliertext)
		lista = self.db.GetSupplierList()	
		self.supplier = QtGui.QComboBox();
		self.supplier.addItems(lista)
		self.supplier.setCurrentIndex(kpm_common.IndexOf(lista, supplier))		
		self.supplier.setEditable(False)
		self.form_layout6.addWidget(self.supplier)
		self.layout.addLayout(self.form_layout6)						

		self.form_layout7 = QtGui.QHBoxLayout()
		self.descrtext = QtGui.QLabel("Description")
		self.form_layout7.addWidget(self.descrtext)
		self.description = QtGui.QPlainTextEdit(self)
		self.description.setPlainText(description)
		self.form_layout7.addWidget(self.description)
		self.layout.addLayout(self.form_layout7)	

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
		if kpm_common.isfloat(self.countctrl.text()) and kpm_common.isfloat(self.pricectrl.text()):
			self.accept()
		else:
			kpm_common.errordialog("Data entered is not numeric of empty")
								
	def cancel_btn(self):
		self.reject()


# ---------------------------------------------------------
# StockDispatchDialog
# ---------------------------------------------------------

class StockDispatchDialog(QtGui.QDialog):
	def __init__(self, parent, title):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)		
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtGui.QHBoxLayout()
		self.counttext = QtGui.QLabel("Count")
		self.form_layout1.addWidget(self.counttext)
		self.countctrl = QtGui.QLineEdit(self) 
		#self.countctrl.setText(shortname)
		self.form_layout1.addWidget(self.countctrl)
		self.layout.addLayout(self.form_layout1)
		
		self.form_layout2 = QtGui.QHBoxLayout()
		self.descrtext = QtGui.QLabel("Description")
		self.form_layout2.addWidget(self.descrtext)
		self.description = QtGui.QPlainTextEdit(self)
		#self.pricectrl.setText(shortname)
		self.form_layout2.addWidget(self.description)
		self.layout.addLayout(self.form_layout2)	

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
# BOMDispatchDialog
# ---------------------------------------------------------

class BOMDispatchDialog(QtGui.QDialog):
	def __init__(self, parent, title):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)		
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)					

		self.form_layout1 = QtGui.QVBoxLayout()
		self.bomtext = QtGui.QLabel("BOM")
		self.form_layout1.addWidget(self.bomtext)
		self.bomctrl = QtGui.QListWidget(self) 
		#self.countctrl.setText(shortname)
		self.form_layout1.addWidget(self.bomctrl)
		self.layout.addLayout(self.form_layout1)
		
		self.form_layout2 = QtGui.QHBoxLayout()
		self.counttext = QtGui.QLabel("Count")
		self.form_layout2.addWidget(self.counttext)
		self.countctrl = QtGui.QLineEdit(self) 
		#self.countctrl.setText(shortname)
		self.form_layout1.addWidget(self.countctrl)
		self.layout.addLayout(self.form_layout2)
		
		self.form_layout3 = QtGui.QHBoxLayout()
		self.descrtext = QtGui.QLabel("Description")
		self.form_layout3.addWidget(self.descrtext)
		self.description = QtGui.QPlainTextEdit(self)
		#self.pricectrl.setText(shortname)
		self.form_layout3.addWidget(self.description)
		self.layout.addLayout(self.form_layout3)	

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
		
		self.db = kpm_db.Kpm_Db(kpm_config.sqlconfig)
		self.UpdateBOMs()
		self.bomid = 0
		
		self.bomctrl.OnItem.connect(self.OnBOM)
		
	def ok_btn(self):
		self.accept()
								
	def cancel_btn(self):
		self.reject()			
		
	def UpdateBOMs(self):
		boms = self.db.Select('bom', sqlbomfields)
		i = 0
		self.bomctrl.DeleteAllItems()
		for bom in boms:
			self.bomctrl.InsertStringItem(i, bom[1]+' v. '+str(bom[2]))
			self.bomctrl.SetItemData(i, long(bom[0]))
			i+=1
	
	def OnBOM(self, event):
		item = event.GetItem()
		ids = item.GetId()
		self.bomid = self.bomctrl.GetItemData(ids)

# ---------------------------------------------------------
# StockFlow Frame
# ---------------------------------------------------------

class StockFlow(QtGui.QDialog):
	def __init__(self, parent, title="Stock flow"):
		QtGui.QWidget.__init__(self, parent)
		self.setWindowTitle(title)		
		self.setWindowModality(QtCore.Qt.ApplicationModal)
		self.layout = QtGui.QVBoxLayout()
		self.setLayout(self.layout)					
		self.db = parent.db

		self.form_layout1 = QtGui.QHBoxLayout()
		self.fromtext = QtGui.QLabel("From")
		self.form_layout1.addWidget(self.fromtext)
		t = QtCore.QDate().currentDate()
		t.addDays(-30)
		self.datefrom = QtGui.QDateEdit(self)
		self.datefrom.setDisplayFormat('dd-MM-yyyy')
		self.datefrom.setCalendarPopup(True)
		self.datefrom.setDate(t)		
		#self.countctrl.setText(shortname)
		self.form_layout1.addWidget(self.datefrom)
		self.layout.addLayout(self.form_layout1)
		
		self.form_layout2 = QtGui.QHBoxLayout()
		self.totext = QtGui.QLabel("To")
		self.form_layout2.addWidget(self.totext)
		t = QtCore.QDate().currentDate()
		self.dateto = QtGui.QDateEdit(self)
		self.dateto.setDisplayFormat('dd-MM-yyyy')
		self.dateto.setCalendarPopup(True)
		self.dateto.setDate(t)		
		#self.countctrl.setText(shortname)
		self.form_layout2.addWidget(self.dateto)
		self.layout.addLayout(self.form_layout2)
		self.datefrom.dateChanged.connect(self.UpdateFlow)
		self.dateto.dateChanged.connect(self.UpdateFlow)				
		
		self.form_layout3 = QtGui.QVBoxLayout()
		self.flotext = QtGui.QLabel("Flow-Control")
		self.form_layout3.addWidget(self.flotext)
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
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part Name","Change","Price","Curr","PartNum","Supplier","Description"]))			
		self.form_layout3.addWidget(self.flowctrl)
		self.layout.addLayout(self.form_layout3)

		self.button_layout = QtGui.QHBoxLayout()
		self.pb_ok = QtGui.QPushButton(self)
		self.pb_ok.setText("Close")
		self.button_layout.addWidget(self.pb_ok)
		self.layout.addLayout(self.button_layout)
				
		self.pb_ok.clicked.connect(self.OnClose)				
		
		self.UpdateFlow()
		
	def UpdateFlow(self):
		datefrom = self.datefrom.date()
		dateto = self.dateto.date()
		df = datefrom.toString(QtCore.Qt.ISODate)
		dt = dateto.toString(QtCore.Qt.ISODate)
		where = "(f.time>='" + df + "') AND (f.time<='"+ dt +"') ORDER BY f.id DESC"
		rows = self.db.GetStockFlow(sqlflowfields, str(where))
		self.flowctrl.clear()
		self.flowctrl.setRowCount(0)
		self.flowctrl.setHorizontalHeaderLabels(QtCore.QStringList(["ID","Date","Part Name","Change","Price","Curr","PartNum","Supplier","Description"]))			
		i = 0
		for row in rows:
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

	def OnClose(self):
		self.close()				
