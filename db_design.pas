unit db_design;

{$mode delphi}{$H+}
     interface
     uses
        classes,
        ujson,
        SysUtils,
        udb_types,
        SynCommons;

     const
      db_version =0.1;
   db_json='{'+
'	"database_name": "db",'+
'	"tables": ['+
'		{'+
'			"table_name": "words",'+
'			"fields": ['+
'				{'+
'					"field_name": "word",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 50,'+
'					"is_unique": true,'+
'					"is_not_null": true,'+
'					"is_indexed": true,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 50,'+
'					"display_label": "كلمات",'+
'					"is_calculated": false,'+
'					"ind": 1'+
'				},'+
'				{'+
'					"field_name": "words_clean",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 50,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": true,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 20,'+
'					"display_label": "تشكيل",'+
'					"is_calculated": false,'+
'					"ind": 2'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"words\"(\"word\",\"words_clean\")\n    VALUES(:word,:words_clean);",'+
'			"insert_params_count": 2,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "titles",'+
'			"fields": ['+
'				{'+
'					"field_name": "title",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": true,'+
'					"is_not_null": true,'+
'					"is_indexed": true,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 1'+
'				},'+
'				{'+
'					"field_name": "title_clean",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": true,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 2'+
'				},'+
'				{'+
'					"field_name": "parent_id",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 3'+
'				},'+
'				{'+
'					"field_name": "weight",'+
'					"field_type": "REAL",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 4'+
'				},'+
'				{'+
'					"field_name": "id_font",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 5'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"titles\"(\"title\",\"title_clean\",\"parent_id\",\"weight\",\"id_font\")\n    VALUES(:title,:title_clean,:parent_id,:weight,:id_font);",'+
'			"insert_params_count": 5,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "studies",'+
'			"fields": ['+
'				{'+
'					"field_name": "study",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 14'+
'				},'+
'				{'+
'					"field_name": "study_clean",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 15'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"studies\"(\"study\",\"study_clean\")\n    VALUES(:study,:study_clean);",'+
'			"insert_params_count": 2,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "version",'+
'			"fields": ['+
'				{'+
'					"field_name": "db_version",'+
'					"field_type": "REAL",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 17'+
'				}],'+
'			"default_data": "[\n  {\n    \"id\" : 1,\n    \"version\" : 0,\n    \"dbVersion\" : 0.1\n  }\n]",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"version\"(\"db_version\")\n    VALUES(:db_version);",'+
'			"insert_params_count": 1,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "title_parent",'+
'			"fields": ['+
'				{'+
'					"field_name": "id_title",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 18'+
'				},'+
'				{'+
'					"field_name": "id_parent",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 19'+
'				},'+
'				{'+
'					"field_name": "title",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "TITRE",'+
'					"is_calculated": true,'+
'					"ind": 20'+
'				},'+
'				{'+
'					"field_name": "parent",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 21'+
'				},'+
'				{'+
'					"field_name": "id_study",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 22'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"title_parent\"(\"id_title\",\"id_parent\",\"id_study\")\n    VALUES(:id_title,:id_parent,:id_study);",'+
'			"insert_params_count": 5,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "book",'+
'			"fields": ['+
'				{'+
'					"field_name": "name",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "الكتاب",'+
'					"is_calculated": false,'+
'					"ind": 1'+
'				},'+
'				{'+
'					"field_name": "id_chikh",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 2'+
'				},'+
'				{'+
'					"field_name": "id_mohakik",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 3'+
'				},'+
'				{'+
'					"field_name": "mohakik",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "المحقق",'+
'					"is_calculated": true,'+
'					"ind": 4'+
'				},'+
'				{'+
'					"field_name": "chikh",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "الشيخ",'+
'					"is_calculated": true,'+
'					"ind": 5'+
'				},'+
'				{'+
'					"field_name": "printer",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 28'+
'				},'+
'				{'+
'					"field_name": "year_of_printing",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 29'+
'				},'+
'				{'+
'					"field_name": "tachkil",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 36'+
'				},'+
'				{'+
'					"field_name": "name_tachkil",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 37'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"book\"(\"name\",\"id_chikh\",\"id_mohakik\",\"printer\",\"year_of_printing\",\"tachkil\")\n    VALUES(:name,:id_chikh,:id_mohakik,:printer,:year_of_printing,:tachkil);",'+
'			"insert_params_count": 9,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "chikh",'+
'			"fields": ['+
'				{'+
'					"field_name": "name",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "الشيخ",'+
'					"is_calculated": false,'+
'					"ind": 30'+
'				},'+
'				{'+
'					"field_name": "date_birth",'+
'					"field_type": "DATETIME",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 31'+
'				},'+
'				{'+
'					"field_name": "date_die",'+
'					"field_type": "DATETIME",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 32'+
'				},'+
'				{'+
'					"field_name": "tachkil",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 33'+
'				},'+
'				{'+
'					"field_name": "name_tachkil",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 35'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"chikh\"(\"name\",\"date_birth\",\"date_die\",\"tachkil\")\n    VALUES(:name,:date_birth,:date_die,:tachkil);",'+
'			"insert_params_count": 5,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "font",'+
'			"fields": ['+
'				{'+
'					"field_name": "font_family",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 1'+
'				},'+
'				{'+
'					"field_name": "name",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 2'+
'				},'+
'				{'+
'					"field_name": "size",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 3'+
'				},'+
'				{'+
'					"field_name": "is_bold",'+
'					"field_type": "BOOL",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 4'+
'				},'+
'				{'+
'					"field_name": "is_italic",'+
'					"field_type": "BOOL",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 5'+
'				},'+
'				{'+
'					"field_name": "is_underline",'+
'					"field_type": "BOOL",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 6'+
'				},'+
'				{'+
'					"field_name": "id_color",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "0",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": false,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 7'+
'				},'+
'				{'+
'					"field_name": "color",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 20,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 8'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"font\"(\"font_family\",\"name\",\"size\",\"is_bold\",\"is_italic\",\"is_underline\",\"id_color\")\n    VALUES(:font_family,:name,:size,:is_bold,:is_italic,:is_underline,:id_color);",'+
'			"insert_params_count": 8,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "colors",'+
'			"fields": ['+
'				{'+
'					"field_name": "name",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 20,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 50'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"colors\"(\"name\")\n    VALUES(:name);",'+
'			"insert_params_count": 1,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		},'+
'		{'+
'			"table_name": "topics",'+
'			"fields": ['+
'				{'+
'					"field_name": "topic",'+
'					"field_type": "TEXT",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "الموضوع",'+
'					"is_calculated": false,'+
'					"ind": 52'+
'				},'+
'				{'+
'					"field_name": "topic_clean",'+
'					"field_type": "TEXT",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 53'+
'				},'+
'				{'+
'					"field_name": "id_book",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 55'+
'				},'+
'				{'+
'					"field_name": "id_chick",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 56'+
'				},'+
'				{'+
'					"field_name": "tome",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 57'+
'				},'+
'				{'+
'					"field_name": "page",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 58'+
'				},'+
'				{'+
'					"field_name": "book",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 59'+
'				},'+
'				{'+
'					"field_name": "chick",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 30,'+
'					"display_label": "",'+
'					"is_calculated": true,'+
'					"ind": 60'+
'				},'+
'				{'+
'					"field_name": "id_parent",'+
'					"field_type": "INTEGER",'+
'					"field_length": 0,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 0,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 62'+
'				},'+
'				{'+
'					"field_name": "topic_type",'+
'					"field_type": "VARCHAR",'+
'					"field_length": 255,'+
'					"is_unique": false,'+
'					"is_not_null": false,'+
'					"is_indexed": false,'+
'					"default_value": "",'+
'					"description": "",'+
'					"is_required": false,'+
'					"is_visible": true,'+
'					"is_read_only": false,'+
'					"display_width": 20,'+
'					"display_label": "",'+
'					"is_calculated": false,'+
'					"ind": 63'+
'				}],'+
'			"default_data": "",'+
'			"description": "",'+
'			"insert_sql": "    INSERT INTO \"topics\"(\"topic\",\"topic_clean\",\"id_book\",\"id_chick\",\"tome\",\"page\",\"id_parent\",\"topic_type\")\n    VALUES(:topic,:topic_clean,:id_book,:id_chick,:tome,:page,:id_parent,:topic_type);",'+
'			"insert_params_count": 10,'+
'			"is_view": false,'+
'			"create_sql": ""'+
'		}],'+
'	"version": 0.1,'+
'	"description": "",'+
'	"db_path": ""'+
'}';


    //----------------------------words---------------------------------

   words_table_name='words';
   sql_words_tbl_create= '  CREATE TABLE "words" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "word" VARCHAR(50)  UNIQUE  NOT NULL ,'+
'     "words_clean" VARCHAR(50) );' ;

     words_word='word';
     words_words_clean='words_clean';
sql_words_insert='    INSERT INTO "words"("word","words_clean")'+
'    VALUES(:word,:words_clean);';


    //----------------------------titles---------------------------------

   titles_table_name='titles';
   sql_titles_tbl_create= '  CREATE TABLE "titles" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "title" VARCHAR(255)  UNIQUE  NOT NULL ,'+
'     "title_clean" VARCHAR(255) ,'+
'     "parent_id" INTEGER,'+
'     "weight" REAL DEFAULT 0,'+
'     "id_font" INTEGER);' ;

     titles_title='title';
     titles_title_clean='title_clean';
     titles_parent_id='parent_id';
     titles_weight='weight';
     titles_id_font='id_font';
sql_titles_insert='    INSERT INTO "titles"("title","title_clean","parent_id","weight","id_font")'+
'    VALUES(:title,:title_clean,:parent_id,:weight,:id_font);';


    //----------------------------studies---------------------------------

   studies_table_name='studies';
   sql_studies_tbl_create= '  CREATE TABLE "studies" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "study" VARCHAR(255) ,'+
'     "study_clean" VARCHAR(255) );' ;

     studies_study='study';
     studies_study_clean='study_clean';
sql_studies_insert='    INSERT INTO "studies"("study","study_clean")'+
'    VALUES(:study,:study_clean);';


    //----------------------------version---------------------------------

   version_table_name='version';
   sql_version_tbl_create= '  CREATE TABLE "version" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "db_version" REAL DEFAULT 0);' ;

     version_db_version='db_version';
sql_version_insert='    INSERT INTO "version"("db_version")'+
'    VALUES(:db_version);';


    //----------------------------title_parent---------------------------------

   title_parent_table_name='title_parent';
   sql_title_parent_tbl_create= '  CREATE TABLE "title_parent" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "id_title" INTEGER,'+
'     "id_parent" INTEGER,'+
'     "id_study" INTEGER);' ;

     title_parent_id_title='id_title';
     title_parent_id_parent='id_parent';
     title_parent_title='title';
     title_parent_parent='parent';
     title_parent_id_study='id_study';
sql_title_parent_insert='    INSERT INTO "title_parent"("id_title","id_parent","id_study")'+
'    VALUES(:id_title,:id_parent,:id_study);';


    //----------------------------book---------------------------------

   book_table_name='book';
   sql_book_tbl_create= '  CREATE TABLE "book" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "name" VARCHAR(255) ,'+
'     "id_chikh" INTEGER,'+
'     "id_mohakik" INTEGER,'+
'     "printer" VARCHAR(255) ,'+
'     "year_of_printing" INTEGER,'+
'     "tachkil" VARCHAR(255) );' ;

     book_name='name';
     book_id_chikh='id_chikh';
     book_id_mohakik='id_mohakik';
     book_mohakik='mohakik';
     book_chikh='chikh';
     book_printer='printer';
     book_year_of_printing='year_of_printing';
     book_tachkil='tachkil';
     book_name_tachkil='name_tachkil';
sql_book_insert='    INSERT INTO "book"("name","id_chikh","id_mohakik","printer","year_of_printing","tachkil")'+
'    VALUES(:name,:id_chikh,:id_mohakik,:printer,:year_of_printing,:tachkil);';


    //----------------------------chikh---------------------------------

   chikh_table_name='chikh';
   sql_chikh_tbl_create= '  CREATE TABLE "chikh" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "name" VARCHAR(255) ,'+
'     "date_birth" DATETIME,'+
'     "date_die" DATETIME,'+
'     "tachkil" VARCHAR(255) );' ;

     chikh_name='name';
     chikh_date_birth='date_birth';
     chikh_date_die='date_die';
     chikh_tachkil='tachkil';
     chikh_name_tachkil='name_tachkil';
sql_chikh_insert='    INSERT INTO "chikh"("name","date_birth","date_die","tachkil")'+
'    VALUES(:name,:date_birth,:date_die,:tachkil);';


    //----------------------------font---------------------------------

   font_table_name='font';
   sql_font_tbl_create= '  CREATE TABLE "font" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "font_family" VARCHAR(255) ,'+
'     "name" VARCHAR(255) ,'+
'     "size" INTEGER,'+
'     "is_bold" BOOL DEFAULT 0,'+
'     "is_italic" BOOL DEFAULT 0,'+
'     "is_underline" BOOL DEFAULT 0,'+
'     "id_color" INTEGER DEFAULT 0);' ;

     font_font_family='font_family';
     font_name='name';
     font_size='size';
     font_is_bold='is_bold';
     font_is_italic='is_italic';
     font_is_underline='is_underline';
     font_id_color='id_color';
     font_color='color';
sql_font_insert='    INSERT INTO "font"("font_family","name","size","is_bold","is_italic","is_underline","id_color")'+
'    VALUES(:font_family,:name,:size,:is_bold,:is_italic,:is_underline,:id_color);';


    //----------------------------colors---------------------------------

   colors_table_name='colors';
   sql_colors_tbl_create= '  CREATE TABLE "colors" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "name" VARCHAR(255) );' ;

     colors_name='name';
sql_colors_insert='    INSERT INTO "colors"("name")'+
'    VALUES(:name);';


    //----------------------------topics---------------------------------

   topics_table_name='topics';
   sql_topics_tbl_create= '  CREATE TABLE "topics" ('+
'     "id" INTEGER PRIMARY KEY {if Sqlite} AUTOINCREMENT {else} AUTO_INCREMENT {endif},'+
'     "topic" TEXT,'+
'     "topic_clean" TEXT,'+
'     "id_book" INTEGER,'+
'     "id_chick" INTEGER,'+
'     "tome" INTEGER,'+
'     "page" INTEGER,'+
'     "id_parent" INTEGER,'+
'     "topic_type" VARCHAR(255) );' ;

     topics_topic='topic';
     topics_topic_clean='topic_clean';
     topics_id_book='id_book';
     topics_id_chick='id_chick';
     topics_tome='tome';
     topics_page='page';
     topics_book='book';
     topics_chick='chick';
     topics_id_parent='id_parent';
     topics_topic_type='topic_type';
sql_topics_insert='    INSERT INTO "topics"("topic","topic_clean","id_book","id_chick","tome","page","id_parent","topic_type")'+
'    VALUES(:topic,:topic_clean,:id_book,:id_chick,:tome,:page,:id_parent,:topic_type);';

 var 
   db_def:mndatabase;
implementation
initialization
    TTextWriter.RegisterCustomJSONSerializerFromText( TypeInfo(db_def),__mndatabase_entry_value).Options := [soReadIgnoreUnknownFields,soWriteHumanReadable];
 db_def := deserializer<mndatabase>(db_json);
END.
