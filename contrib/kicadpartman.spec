# -*- mode: python ; coding: utf-8 -*-

block_cipher = None


a = Analysis(['kicadpartman.py'],
             pathex=['D:\\INVES\\PYCODE\\kcPm3'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)

a.datas += [('main.png','main.png','DATA'),('exit.png','exit.png','DATA'),('backup.png','backup.png','DATA'),
			('add-cat.png','add-cat.png','DATA'),('add-part.png','add-part.png','DATA'),('edit-cat.png','edit-cat.png','DATA'),
			('edit-part.png','edit-part.png','DATA'),('del-cat.png','del-cat.png','DATA'),('del-part.png','del-part.png','DATA'),
			('receive-part.png','receive-part.png','DATA'),('import-bom.png','import-bom.png','DATA'),
			('dispatch-part.png','dispatch-part.png','DATA'),('export-bom.png','export-bom.png','DATA'),
			('stock-flow.png','stock-flow.png','DATA'),('suppliers.png','suppliers.png','DATA'),
			('bom.png','bom.png','DATA'),('places.png','places.png','DATA'),('projects.png','projects.png','DATA'),			
			('assing.png','assing.png','DATA'),('im-bom.png','im-bom.png','DATA'),('about.png','about.png','DATA')]				 
			 
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          [],
          name='kicadpartman',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=False , icon='main.ico')
