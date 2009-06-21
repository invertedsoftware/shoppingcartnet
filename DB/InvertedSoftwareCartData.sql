/****** Data ******/

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('common'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('health monitoring'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('membership'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('personalization'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('profile'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('role manager'
           ,'1'
           ,1)

INSERT INTO [aspnet_Applications]
           ([ApplicationName]
           ,[LoweredApplicationName]
           ,[ApplicationId]
           ,[Description])
     VALUES
           ('InvertedSoftwareCart'
           ,'invertedsoftwarecart'
           ,'de7c5af1-8dcc-4633-921f-8001edca639e'
           ,NULL)

INSERT INTO [aspnet_Users]
           ([ApplicationId]
           ,[UserId]
           ,[UserName]
           ,[LoweredUserName]
           ,[MobileAlias]
           ,[IsAnonymous]
           ,[LastActivityDate])
     VALUES
           ('de7c5af1-8dcc-4633-921f-8001edca639e'
           ,'79ad50d5-8028-44c1-b6ad-723885c4e3b9'
           ,'admin'
           ,'admin'
           ,NULL
           ,0
           ,'3/14/2009')


INSERT INTO [aspnet_Membership]
           ([ApplicationId]
           ,[UserId]
           ,[Password]
           ,[PasswordFormat]
           ,[PasswordSalt]
           ,[MobilePIN]
           ,[Email]
           ,[LoweredEmail]
           ,[PasswordQuestion]
           ,[PasswordAnswer]
           ,[IsApproved]
           ,[IsLockedOut]
           ,[CreateDate]
           ,[LastLoginDate]
           ,[LastPasswordChangedDate]
           ,[LastLockoutDate]
           ,[FailedPasswordAttemptCount]
           ,[FailedPasswordAttemptWindowStart]
           ,[FailedPasswordAnswerAttemptCount]
           ,[FailedPasswordAnswerAttemptWindowStart]
           ,[Comment])
     VALUES
           ('de7c5af1-8dcc-4633-921f-8001edca639e'
           ,'79ad50d5-8028-44c1-b6ad-723885c4e3b9'
           ,'5iorYh0UgvHosryrXKmtuq3S2YM='
           ,1
           ,'HU0OEf+VUdg5qgoDZwYhNw=='
           ,NULL
           ,'admin@invertedsoftwareshoppingcart.com'
           ,'admin@invertedsoftwareshoppingcart.com'
           ,NULL
           ,NULL
           ,1
           ,0
           ,'3/14/2009'
           ,'3/14/2009'
           ,'3/14/2009'
           ,'3/14/2009'
           ,0
           ,'3/14/2009'
           ,0
           ,'3/14/2009'
           ,NULL)

INSERT INTO [aspnet_Roles]
           ([ApplicationId]
           ,[RoleId]
           ,[RoleName]
           ,[LoweredRoleName]
           ,[Description])
     VALUES
           ('de7c5af1-8dcc-4633-921f-8001edca639e'
           ,'0659121d-5f76-49d7-856e-b7d6d1afb53d'
           ,'Admin'
           ,'admin'
		   , NULL)

INSERT INTO [aspnet_Roles]
           ([ApplicationId]
           ,[RoleId]
           ,[RoleName]
           ,[LoweredRoleName]
           ,[Description])
     VALUES
           ('de7c5af1-8dcc-4633-921f-8001edca639e'
           ,'cd483686-3721-4580-9f69-676b3287b4db'
           ,'Customer'
           ,'customer'
		   , NULL)

INSERT INTO [aspnet_Roles]
           ([ApplicationId]
           ,[RoleId]
           ,[RoleName]
           ,[LoweredRoleName]
           ,[Description])
     VALUES
           ('de7c5af1-8dcc-4633-921f-8001edca639e'
           ,'268bab91-9e6e-4e2b-b0ff-6f8ed6fde3b6'
           ,'SuperAdmin'
           ,'superadmin'
		   , NULL)

INSERT INTO [aspnet_UsersInRoles]
           ([UserId]
           ,[RoleId])
     VALUES
           ('79ad50d5-8028-44c1-b6ad-723885c4e3b9'
           ,'268bab91-9e6e-4e2b-b0ff-6f8ed6fde3b6')

INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AFGHANISTAN', 'AF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LAND ISLANDS', 'AX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ALBANIA', 'AL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ALGERIA', 'DZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AMERICAN SAMOA', 'AS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANDORRA', 'AD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANGOLA', 'AO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANGUILLA', 'AI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANTARCTICA', 'AQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANTIGUA AND BARBUDA', 'AG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARGENTINA', 'AR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARMENIA', 'AM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARUBA', 'AW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AUSTRALIA', 'AU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AUSTRIA', 'AT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AZERBAIJAN', 'AZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BAHAMAS', 'BS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BAHRAIN', 'BH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BANGLADESH', 'BD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BARBADOS', 'BB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELARUS', 'BY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELGIUM', 'BE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELIZE', 'BZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BENIN', 'BJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BERMUDA', 'BM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BHUTAN', 'BT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOLIVIA', 'BO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOSNIA AND HERZEGOVINA', 'BA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOTSWANA', 'BW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOUVET ISLAND', 'BV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRAZIL', 'BR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRITISH INDIAN OCEAN TERRITORY', 'IO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRUNEI DARUSSALAM', 'BN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BULGARIA', 'BG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BURKINA FASO', 'BF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BURUNDI', 'BI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAMBODIA', 'KH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAMEROON', 'CM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CANADA', 'CA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAPE VERDE', 'CV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAYMAN ISLANDS', 'KY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CENTRAL AFRICAN REPUBLIC', 'CF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHAD', 'TD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHILE', 'CL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHINA', 'CN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHRISTMAS ISLAND', 'CX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COCOS (KEELING) ISLANDS', 'CC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COLOMBIA', 'CO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COMOROS', 'KM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CONGO', 'CG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COOK ISLANDS', 'CK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COSTA RICA', 'CR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COTE D''IVOIRE', 'CI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CROATIA', 'HR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CUBA', 'CU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CYPRUS', 'CY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CZECH REPUBLIC', 'CZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DENMARK', 'DK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DJIBOUTI', 'DJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DOMINICA', 'DM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DOMINICAN REPUBLIC', 'DO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ECUADOR', 'EC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EGYPT', 'EG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EL SALVADOR', 'SV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EQUATORIAL GUINEA', 'GQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ERITREA', 'ER', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ESTONIA', 'EE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ETHIOPIA', 'ET', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FALKLAND ISLANDS (MALVINAS)', 'FK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FAROE ISLANDS', 'FO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FIJI', 'FJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FINLAND', 'FI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRANCE', 'FR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH GUIANA', 'GF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH POLYNESIA', 'PF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH SOUTHERN TERRITORIES', 'TF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GABON', 'GA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GAMBIA', 'GM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GEORGIA', 'GE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GERMANY', 'DE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GHANA', 'GH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GIBRALTAR', 'GI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GREECE', 'GR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GREENLAND', 'GL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GRENADA', 'GD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUADELOUPE', 'GP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUAM', 'GU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUATEMALA', 'GT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUERNSEY', 'GG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUINEA', 'GN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUINEA-BISSAU', 'GW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUYANA', 'GY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HAITI', 'HT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HEARD ISLAND AND MCDONALD ISLANDS', 'HM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HOLY SEE (VATICAN CITY STATE)', 'VA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HONDURAS', 'HN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HONG KONG', 'HK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HUNGARY', 'HU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ICELAND', 'IS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('INDIA', 'IN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('INDONESIA', 'ID', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRAN, ISLAMIC REPUBLIC OF', 'IR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRAQ', 'IQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRELAND', 'IE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ISLE OF MAN', 'IM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ISRAEL', 'IL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ITALY', 'IT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JAMAICA', 'JM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JAPAN', 'JP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JERSEY', 'JE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JORDAN', 'JO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KAZAKHSTAN', 'KZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KENYA', 'KE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KIRIBATI', 'KI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'KP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KOREA, REPUBLIC OF', 'KR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KUWAIT', 'KW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KYRGYZSTAN', 'KG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'LA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LATVIA', 'LV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LEBANON', 'LB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LESOTHO', 'LS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIBERIA', 'LR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIBYAN ARAB JAMAHIRIYA', 'LY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIECHTENSTEIN', 'LI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LITHUANIA', 'LT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LUXEMBOURG', 'LU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MACAO', 'MO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MADAGASCAR', 'MG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALAWI', 'MW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALAYSIA', 'MY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALDIVES', 'MV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALI', 'ML', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALTA', 'MT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MARSHALL ISLANDS', 'MH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MARTINIQUE', 'MQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAURITANIA', 'MR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAURITIUS', 'MU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAYOTTE', 'YT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MEXICO', 'MX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MICRONESIA, FEDERATED STATES OF', 'FM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOLDOVA, REPUBLIC OF', 'MD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONACO', 'MC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONGOLIA', 'MN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONTSERRAT', 'MS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOROCCO', 'MA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOZAMBIQUE', 'MZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MYANMAR', 'MM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NAMIBIA', 'NA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NAURU', 'NR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEPAL', 'NP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NETHERLANDS', 'NL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NETHERLANDS ANTILLES', 'AN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEW CALEDONIA', 'NC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEW ZEALAND', 'NZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NICARAGUA', 'NI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIGER', 'NE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIGERIA', 'NG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIUE', 'NU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORFOLK ISLAND', 'NF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORTHERN MARIANA ISLANDS', 'MP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORWAY', 'NO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('OMAN', 'OM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PAKISTAN', 'PK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PALAU', 'PW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PALESTINIAN TERRITORY, OCCUPIED', 'PS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PANAMA', 'PA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PAPUA NEW GUINEA', 'PG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PARAGUAY', 'PY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PERU', 'PE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PHILIPPINES', 'PH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PITCAIRN', 'PN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('POLAND', 'PL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PORTUGAL', 'PT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PUERTO RICO', 'PR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('QATAR', 'QA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('REUNION', 'RE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ROMANIA', 'RO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('RUSSIAN FEDERATION', 'RU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('RWANDA', 'RW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT HELENA', 'SH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT KITTS AND NEVIS', 'KN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT LUCIA', 'LC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT PIERRE AND MIQUELON', 'PM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT VINCENT AND THE GRENADINES', 'VC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAMOA', 'WS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAN MARINO', 'SM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAO TOME AND PRINCIPE', 'ST', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAUDI ARABIA', 'SA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SENEGAL', 'SN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SERBIA AND MONTENEGRO', 'CS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SEYCHELLES', 'SC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SIERRA LEONE', 'SL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SINGAPORE', 'SG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SLOVAKIA', 'SK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SLOVENIA', 'SI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOLOMON ISLANDS', 'SB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOMALIA', 'SO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOUTH AFRICA', 'ZA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'GS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SPAIN', 'ES', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SRI LANKA', 'LK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SUDAN', 'SD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SURINAME', 'SR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SVALBARD AND JAN MAYEN', 'SJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWAZILAND', 'SZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWEDEN', 'SE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWITZERLAND', 'CH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SYRIAN ARAB REPUBLIC', 'SY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TAIWAN, PROVINCE OF CHINA', 'TW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TAJIKISTAN', 'TJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TANZANIA, UNITED REPUBLIC OF', 'TZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('THAILAND', 'TH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TIMOR-LESTE', 'TL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TOGO', 'TG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TOKELAU', 'TK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TONGA', 'TO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TRINIDAD AND TOBAGO', 'TT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TUNISIA', 'TN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKEY', 'TR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKMENISTAN', 'TM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKS AND CAICOS ISLANDS', 'TC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TUVALU', 'TV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UGANDA', 'UG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UKRAINE', 'UA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED ARAB EMIRATES', 'AE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED KINGDOM', 'GB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED STATES', 'US', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED STATES MINOR OUTLYING ISLANDS', 'UM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('URUGUAY', 'UY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UZBEKISTAN', 'UZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VANUATU', 'VU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VENEZUELA', 'VE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIET NAM', 'VN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIRGIN ISLANDS, BRITISH', 'VG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIRGIN ISLANDS, U.S.', 'VI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('WALLIS AND FUTUNA', 'WF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('WESTERN SAHARA', 'EH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('YEMEN', 'YE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ZAMBIA', 'ZM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ZIMBABWE', 'ZW', 1)


INSERT INTO State (StateName, StateCode, Active) VALUES ('Alabama', 'AL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Alaska', 'AK', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('American Samoa', 'AS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Arizona', 'AZ', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Arkansas', 'AR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('California', 'CA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Colorado', 'CO', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Connecticut', 'CT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Delaware', 'DE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('District of Columbia', 'DC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Federated States of Micronesia', 'FM', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Florida', 'FL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Georgia', 'GA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Guam', 'GU', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Hawaii', 'HI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Idaho', 'ID', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Illinois', 'IL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Indiana', 'IN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Iowa', 'IA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Kansas', 'KS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Kentucky', 'KY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Louisiana', 'LA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Maine', 'ME', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Marshall Islands', 'MH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Maryland', 'MD', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Massachusetts', 'MA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Michigan', 'MI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Minnesota', 'MN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Mississippi', 'MS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Missouri', 'MO', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Montana', 'MT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Nebraska', 'NE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Nevada', 'NV', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Hampshire', 'NH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Jersey', 'NJ', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Mexico', 'NM', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New York', 'NY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('North Carolina', 'NC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('North Dakota', 'ND', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Northern Mariana Islands', 'MP', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Ohio', 'OH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Oklahoma', 'OK', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Oregon', 'OR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Palau', 'PW', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Pennsylvania', 'PA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Puerto Rico', 'PR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Rhode Island', 'RI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('South Carolina', 'SC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('South Dakota', 'SD', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Tennessee', 'TN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Texas', 'TX', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Utah', 'UT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Vermont', 'VT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Virgin Islands', 'VI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Virginia', 'VA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Washington', 'WA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('West Virginia', 'WV', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Wisconsin', 'WI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Wyoming', 'WY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces Americas', 'AA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces', 'AE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces Pacific', 'AP', 1)

INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Alberta', 'AB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('British Columbia', 'BC', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Manitoba', 'MB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('New Brunswick', 'NB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Newfoundland and Labrador', 'NL', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Northwest Territories', 'NT', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Nova Scotia', 'NS', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Nunavut', 'NU', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Ontario', 'ON', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Prince Edward Island', 'PE', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Quebec', 'QC', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Saskatchewan', 'SK', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Yukon', 'YT', 1)

INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Accepted', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Verifyed', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Shipped', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('PaymentError', 1)

INSERT INTO CustomFieldType (CustomFieldTypeName, Active) VALUES ('TextBox', 1)
INSERT INTO CustomFieldType (CustomFieldTypeName, Active) VALUES ('CheckBox', 1)