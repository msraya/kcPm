import mysql.connector

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


class Kpm_Db():

	def __init__(self, config):
		self.config = config
		self.cnx = mysql.connector.connect(**config)
		self.categories = []

	def __dev__(self):
		self.cnx.close()

	def GetCategories(self, parent):
		cursor = self.cnx.cursor()
		query = "SELECT id, parent, shortname, value1, value2, value3 FROM categories"
		if parent >= 0:
			query += " WHERE parent='" + parent + "'"
		query += " ORDER BY parent, shortname ASC"
		cursor.execute(query)
		self.categories = cursor.fetchall()
		cursor.close()
		return self.categories
	
	def GetCategory(self, ids):
		cursor = self.cnx.cursor()
		query = "SELECT parent, shortname, fullname, value1, value2, value3, description FROM categories WHERE id='" + str(ids) + "'"
		cursor.execute(query)
		self.category = cursor.fetchone()
		cursor.close()
		return self.category

	def GetParts(self, category):
		cursor = self.cnx.cursor()
		query = "SELECT id, partname FROM parts WHERE category='" + str(category) + "'"
		query += " ORDER BY value1"
		cursor.execute(query)
		self.parts = cursor.fetchall()
		cursor.close()
		return self.parts
	
	def SearchParts(self, field, text):
		cursor = self.cnx.cursor()
		query = "SELECT id, partname FROM parts WHERE LOCATE('" + str(text) + "'," + str(field) + ") > 0 "
		query += " ORDER BY partname"
		cursor.execute(query)
		self.parts = cursor.fetchall()
		cursor.close()
		return self.parts	

	def GetSpares(self, partid, fields):
		cursor = self.cnx.cursor()
		fn = ''
		first = 1
		for f in fields:
			if first == 0:
				fn += ", "
			first = 0
			fn += f
		query = "SELECT " + fn + " FROM spares s INNER JOIN mfgs m ON s.mfg=m.id INNER JOIN suppliers f ON s.supplier=f.id WHERE s.partid='" + str(partid) + "'"
		cursor.execute(query)
		self.spares = cursor.fetchall()
		cursor.close()
		return self.spares

	def GetSpare(self, spareid, fields):
		cursor = self.cnx.cursor()
		fn = ''
		first = 1
		for f in fields:
			if first == 0:
				fn += ", "
			first = 0
			fn += f
		query = "SELECT " + fn + " FROM spares s INNER JOIN mfgs m ON s.mfg=m.id INNER JOIN suppliers f ON s.supplier=f.id WHERE s.id='" + str(spareid) + "'"
		cursor.execute(query)
		self.spare = cursor.fetchone()
		cursor.close()
		return self.spare
	
	def GetManufacturerList(self):
		cursor = self.cnx.cursor()
		query = "SELECT shortname FROM mfgs"
		cursor.execute(query)
		rows = cursor.fetchall()
		mfgid=[]
		for elem in rows:
			mfgid.append(elem[0])
		cursor.close()
		return mfgid
	
	def GetProjectList(self):
		cursor = self.cnx.cursor()
		query = "SELECT shortname FROM projects"
		cursor.execute(query)
		rows = cursor.fetchall()
		projects=[]
		for elem in rows:
			projects.append(elem[0])
		cursor.close()
		return projects

	def GetLocationList(self):
		cursor = self.cnx.cursor()
		query = "SELECT shortname FROM places"
		cursor.execute(query)
		rows = cursor.fetchall()
		places=[]
		for elem in rows:
			places.append(elem[0])
		cursor.close()
		return places	

	def GetManufacturer(self, name):
		cursor = self.cnx.cursor()
		query = "SELECT id FROM mfgs WHERE shortname LIKE '" + name + "'"
		cursor.execute(query)
		rows = cursor.fetchall()
		if cursor.rowcount == 1:
			mfgid = rows[0][0]
		else:
			mfgid = 0
		cursor.close()
		return mfgid
	
	def GetSupplierList(self):
		cursor = self.cnx.cursor()
		query = "SELECT shortname FROM suppliers"
		cursor.execute(query)
		rows = cursor.fetchall()
		sid=[]
		for elem in rows:
			sid.append(elem[0])
		cursor.close()
		return sid

	def GetSupplier(self, name):
		cursor = self.cnx.cursor()
		query = "SELECT id FROM suppliers WHERE shortname LIKE '" + name + "'"
		cursor.execute(query)
		rows = cursor.fetchall()
		if cursor.rowcount == 1:
			sid = rows[0][0]
		else:
			sid = 0
		cursor.close()
		return sid
	
	def GetSupplierName(self, ids):
		cursor = self.cnx.cursor()
		query = "SELECT shortname FROM suppliers WHERE id = " + str(ids)
		cursor.execute(query)
		rows = cursor.fetchall()
		if cursor.rowcount == 1:
			sid = rows[0][0]
		else:
			sid = 0
		cursor.close()
		return sid

	def Stock(self, partid, count, dates="", price=0, currency="", partnumber="",supplier=0, bom=0, description=""):
		cursor = self.cnx.cursor()

		query = "UPDATE stock SET count=count+'" + str(count) + "'"
		if price != 0:
			query += ", price='" + str(price) + "', currency='" + currency + "'"
		query += "WHERE id='" + str(partid) + "';"
		#print(query)
		cursor.execute(query)
		if cursor.rowcount == 0:
			query = "INSERT INTO stock (id, count, price, currency) VALUES ('" + str(partid) + "', '" + str(count) + "', '" + str(price) + "', '" + currency + "');"
			#print(query)
			cursor.execute(query)
		if count < 0:
			query = "SELECT id FROM flow WHERE part = '" + str(partid) + "' ORDER BY time DESC;"
			#print(query)
			cursor.execute(query)
			rows = cursor.fetchall()
			row = rows[0]			
			query = "SELECT price, currency, partnumber, supplier, bom FROM flow WHERE id = '" + str(row[0]) + "';"
			#print(query)
			cursor.execute(query)
			rows = cursor.fetchall()
			row = rows[0]
			price = row[0]
			currency = row[1]
			partnumber = row[2]
			supplier = row[3]
			bom = row[4]
		if dates == "":
			query = "INSERT INTO flow (part, count, bom, price, currency, partnumber, supplier, description) VALUES ('" + str(partid) + "', '" + str(count) + "', '" + str(bom) + "', '" + str(price) + "', '" + currency + "', '" + partnumber + "', '" + str(supplier) + "', '" + description + "');"		
		else:
			query = "INSERT INTO flow (part, time, count, bom, price, currency, partnumber, supplier, description) VALUES ('" + str(partid) + "', '" + str(dates) + "', '" + str(count) + "', '" + str(bom) + "', '" + str(price) + "', '" + currency + "', '" + partnumber + "', '" + str(supplier) + "', '" + description + "');"
		#print(query)
		cursor.execute(query)
		
		cursor.close()
		self.cnx.commit()

	def GetStockFlow(self, fields, where):
		cursor = self.cnx.cursor()
		fn = ''
		first = 1
		for f in fields:
			if first == 0:
				fn += ", "
			first = 0
			fn += f
		query = "SELECT " + fn + " FROM flow f INNER JOIN parts p ON f.part=p.id WHERE " + where
		#print(query)
		cursor.execute(query)
		rows = cursor.fetchall()
		# columns = cursor.description
		# print(self.spares)
		cursor.close()
		return rows

	# Select from database
	def Select(self, table, fields, where=None, sort=None):
		cursor = self.cnx.cursor()
		names = ""
		for key in fields:
			if names != "":
				names += ", "
			names += "`" + key + "`"

		query = "SELECT " + names + " FROM " + table;
		if where != None:
			w = ""
			for key in where:
				if w != "":
					w += " AND "
			#	if type(where[key]) in [str, unicode]:
			#		w += str(key) + " LIKE '" + str(where[key]) + "'"
			#	else:
				w += str(key) + "='" + str(where[key]) + "'"
			query += " WHERE " + w;
		if sort != None:
			query += " ORDER BY " + sort
		print(query)
		cursor.execute(query)
		rows = cursor.fetchall()
		cursor.close()

		return rows

	def Insert(self, table, data):
		# Insert to database
		cursor = self.cnx.cursor()
		names = "("
		values = "("
		first = 1
		for key in data:
			if first == 0:
				names += ", "
				values += ", "
			first = 0
			names += "`" + str(key) + "`"
			values += "'" + str(data[key]) + "'"
		names += ")"
		values += ")"

		query = "INSERT INTO " + table + " " + names + " VALUES " + values + ";"
		# print(query)
		# rowid = 88888
		cursor.execute(query)
		rowid = cursor.lastrowid
		self.cnx.commit()
		cursor.close()

		return rowid

	def Update(self, table, data, where):
		# Insert to database
		cursor = self.cnx.cursor()
		values = ""
		for key in data:
			if values != "":
				values += ", "
			# first = 0
			values += str(key) + "='" + str(data[key]) + "'"

		w = ""
		for key in where:
			if w != "":
				w += " AND "
			# first = 0
			w += str(key) + "='" + str(where[key]) + "'"

		query = "UPDATE " + table + " SET " + values + " WHERE " + w + ";"
		# print(query)
		cursor.execute(query)
		self.cnx.commit()
		cursor.close()

		return 0

	def Delete(self, table, where):
		# Insert to database
		cursor = self.cnx.cursor()

		w = ""
		for key in where:
			if w != "":
				w += " AND "
			# first = 0
			#if type(where[key]) in [str, unicode]:
				w += str(key) + " LIKE '" + str(where[key]) + "'"
		#	else:
			#	w += unicode(key) + "='" + unicode(where[key]) + "'"

		query = "DELETE FROM " + table + " WHERE " + w + ";"
		#print(query)
		cursor.execute(query)
		self.cnx.commit()
		cursor.close()

		return 0
