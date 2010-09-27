module Faker
  module Address
    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def us_state
      STATE.rand
    end

    def us_state_abbr
      STATE_ABBR.rand
    end

    def city_prefix
      CITY_PREFIXES.rand
    end

    def city_suffix
      CITY_SUFFIXES.rand
    end

    def city
      case rand(4)
      when 0 then '%s %s%s' % [city_prefix, Name.first_name, city_suffix]
      when 1 then '%s %s'   % [city_prefix, Name.first_name]
      when 2 then '%s%s'    % [Name.first_name, city_suffix]
      when 3 then '%s%s'    % [Name.last_name, city_suffix]
      end
    end

    def street_suffix
      STREET_SUFFIX.rand
    end

    def street_name
      case rand(2)
      when 0 then "#{Name.last_name} #{street_suffix}"
      when 1 then "#{Name.first_name} #{street_suffix}"
      end
    end

    def street_address(include_secondary = false)
      str = ( "#" * rand(3) ) << ('### %s' % street_name)
      str << ' ' << secondary_address  if include_secondary

      Faker.numerify(str)
    end

    def secondary_address
      Faker.numerify(SEC_ADDR.rand)
    end

    # UK Variants
    def uk_county
      UK_COUNTY.rand
    end

    def uk_country
      UK_COUNTRY.rand
    end

    def uk_postcode
      Faker.bothify(UK_POSTCODE.rand).upcase
    end

    def neighborhood
      NEIGHBORHOOD.rand
    end
    
    def country
      COUNTRY.rand
    end
    
    def country_code
      COUNTRY_CODE.rand
    end

    ZIP_FORMATS = k ['#####', '#####-####']

    STATE = k ['Alabama', 'Alaska', 'Arizona', 'Arkansas',
      'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida',
      'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas',
      'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts',
      'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana',
      'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
      'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon',
      'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota',
      'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
      'West Virginia', 'Wisconsin', 'Wyoming']

    STATE_ABBR = k %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA
                     KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC
                     ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV
                     WI WY AE AA AP)

    COMPASS_DIRECTIONS = k %w(North East West South)
    CITY_PREFIXES = k(COMPASS_DIRECTIONS + %w(New Lake Port))

    CITY_SUFFIXES = k %w(town ton land ville berg burgh borough bury view port
                        mouth stad furt chester mouth fort haven side shire)

    STREET_SUFFIX = k %w(Alley Avenue Branch Bridge Brook Brooks
      Burg Burgs Bypass Camp Canyon Cape Causeway Center Centers Circle Circles
      Cliff Cliffs Club Common Corner Corners Course Court Courts Cove Coves
      Creek Crescent Crest Crossing Crossroad Curve Dale Dam Divide Drive Drives
      Estate Estates Expressway Extension Extensions Fall Falls Ferry
      Field Fields Flat Flats Ford Fords Forest Forge Forges Fork Forks Fort
      Freeway Garden Gardens Gateway Glen Glens Green Greens Grove Groves Harbor
      Harbors Haven Heights Highway Hill Hills Hollow Inlet Island
      Islands Isle Junction Junctions Key Keys Knoll Knolls Lake
      Lakes Land Landing Lane Light Lights Loaf Lock Locks Lodge Loop
      Mall Manor Manors Meadow Meadows Mews Mill Mills Mission Motorway
      Mount Mountain Mountains Neck Orchard Oval Overpass Park
      Parks Parkway Parkways Pass Passage Path Pike Pine Pines Place Plain Plains
      Plaza Point Points Port Ports Prairie
      Radial Ramp Ranch Rapid Rapids Rest Ridge Ridges River Road Roads
      Route Row Rue Run Shoal Shoals Shore Shores Skyway Spring Springs
      Spur Spurs Square Squares Station Stravenue
      Stream Street Streets Summit Terrace
      Throughway Trace Track Trafficway Trail Tunnel
      Turnpike Underpass Union Unions Valley Valleys Via Viaduct View Views
      Village Villages Ville Vista Walk Walks Wall Way Ways Well Wells)

    SEC_ADDR = k ['Apt. ###', 'Suite ###']

    UK_COUNTY = k ['Avon', 'Bedfordshire', 'Berkshire', 'Borders',
      'Buckinghamshire', 'Cambridgeshire', 'Central', 'Cheshire', 'Cleveland',
      'Clwyd', 'Cornwall', 'County Antrim', 'County Armagh', 'County Down',
      'County Fermanagh', 'County Londonderry', 'County Tyrone', 'Cumbria',
      'Derbyshire', 'Devon', 'Dorset', 'Dumfries and Galloway', 'Durham',
      'Dyfed', 'East Sussex', 'Essex', 'Fife', 'Gloucestershire', 'Grampian',
      'Greater Manchester', 'Gwent', 'Gwynedd County', 'Hampshire',
      'Herefordshire', 'Hertfordshire', 'Highlands and Islands', 'Humberside',
      'Isle of Wight', 'Kent', 'Lancashire', 'Leicestershire', 'Lincolnshire',
      'Lothian', 'Merseyside', 'Mid Glamorgan', 'Norfolk', 'North Yorkshire',
      'Northamptonshire', 'Northumberland', 'Nottinghamshire', 'Oxfordshire',
      'Powys', 'Rutland', 'Shropshire', 'Somerset', 'South Glamorgan',
      'South Yorkshire', 'Staffordshire', 'Strathclyde', 'Suffolk', 'Surrey',
      'Tayside', 'Tyne and Wear', 'Warwickshire', 'West Glamorgan', 'West Midlands',
      'West Sussex', 'West Yorkshire', 'Wiltshire', 'Worcestershire']

    UK_COUNTRY = k ['England', 'Scotland', 'Wales', 'Northern Ireland']

    UK_POSTCODE = k ['??# #??', '??## #??']

    NEIGHBORHOOD = k ['East of Telegraph Road', 'North Norridge', 'Northwest Midlothian/Midlothian Country Club',
      'Mott Haven/Port Morris', 'Kingsbridge Heights', 'Bronxdale', 'Pennypack', 'Bridesburg',
      'Allegheny West', 'Bushwick South', 'Dyker Heights', 'Ocean Parkway South', 'Summerlin North',
      'Seven Hills Area', 'Greater Las Vegas National', 'phoenix', 'Central Chandler', 'South of Bell Road',
      'River Heights', 'White Plains Central', 'Mount Kisco West', 'Pound Ridge East', 'Babylon Bayside',
      'Sagaponack Seaside', 'South of Lake Ave', 'Far Rockaway/Bayswater', 'Jamaica Estates/Holliswood',
      'Murray Hill', 'East Renton', 'Renton West', 'Auburn North', 'Northwoods West', 'Florissant West',
      'Ladue South', 'Candlewood Country Club', 'West Covina East', 'North East Irwindale', 'Sunshine-Gardens',
      'Cipriani', 'Brentwood Central', 'Jupiter South/Abacoa', 'Sea Ranch Lakes', 'Schall Circle/Lakeside Green',
      'Olmsted Falls Central', 'South of Lake Shore Blvd', 'Gates Mills North', 'White Oak South of Columbia Pike',
      'Rockville East of Hungerford Dr', 'Cleveland Park']
      
      
    COUNTRY = k ['Ascension Island','Andorra','United Arab Emirates','Afghanistan','Antigua and Barbuda',
      'Anguilla','Albania','Armenia','Netherlands Antilles','Angola','Argentina','American Samoa',
      'Austria','Australia','Aruba','Azerbaijan','Bosnia and Herzegovina','Barbados','Bangladesh','Belgium',
      'Burkina Faso','Bulgaria','Bahrain','Burundi','Benin','Bermuda','Brunei Darussalam','Bolivia','Brazil',
      'Bahamas','Bhutan','Bouvet Island','Botswana','Belarus','Belize','Canada','Congo, Democratic Republic',
      'Central African Republic','Congo','Switzerland','Cote D\'Ivoire (Ivory Coast)','Cook Islands','Chile',
      'Cameroon','China','Colombia','Costa Rica','Cuba','Cape Verde','Christmas Island','Cyprus','Czech Republic',
      'Germany','Djibouti','Denmark','Dominica','Dominican Republic','Algeria','Ecuador','Estonia','Egypt','Eritrea',
      'Spain','Ethiopia','Finland','Fiji','Falkland Islands','Micronesia','Faroe Islands','France','Gabon',
      'Great Britain (UK)','Grenada','Georgia','French Guiana','Ghana','Gibraltar','Greenland','Gambia','Guinea',
      'Guadeloupe','Equatorial Guinea','Greece','South Georgia and the South Sandwich Islands','Guatemala','Guam',
      'Guinea-Bissau','Guyana','Hong Kong','Honduras','Croatia','Haiti','Hungary','Indonesia','Ireland','Israel',
      'Isle of Man','India','British Indian Ocean Territory','Iraq','Iran','Iceland','Italy','Jersey','Jamaica',
      'Jordan','Japan','Kenya','Kyrgyzstan','Cambodia','Kiribati','Comoros','Saint Kitts and Nevis','Korea (North)',
      'Korea (South)','Kuwait','Cayman Islands','Kazakhstan','Laos','Lebanon','Saint Lucia','Liechtenstein',
      'Sri Lanka','Liberia','Lesotho','Lithuania','Luxembourg','Latvia','Libya','Morocco','Monaco','Moldova',
      'Montenegro','Madagascar','Marshall Islands','Macedonia','Mali','Myanmar','Mongolia','Macau',
      'Northern Mariana Islands','Martinique','Mauritania','Montserrat','Malta','Mauritius','Maldives','Malawi',
      'Mexico','Malaysia','Mozambique','Namibia','New Caledonia','Niger','Norfolk Island','Nigeria','Nicaragua',
      'Netherlands','Norway','Nepal','Nauru','Niue','New Zealand','Oman','Panama','Peru','French Polynesia',
      'Papua New Guinea','Philippines','Pakistan','Poland','St. Pierre and Miquelon','Pitcairn','Puerto Rico',
      'Palestinian Territory, Occupied','Portugal','Palau','Paraguay','Qatar','Réunion','Romania','Serbia',
      'Russian Federation','Rwanda','Saudi Arabia','Solomon Islands','Seychelles','Sudan','Sweden','Singapore',
      'St. Helena','Slovenia','Slovakia, Republic of','Sierra Leone','San Marino','Senegal','Somalia','Suriname',
      'São Tomé and Príncipe','El Salvador','Syria','Swaziland','Turks and Caicos Islands','Chad','Togo','Thailand',
      'Tajikistan','Tokelau','Turkmenistan','Tunisia','Tonga','East Timor','Turkey','Trinidad and Tobago','Tuvalu',
      'Taiwan','Tanzania','Ukraine','Uganda','United Kingdom','US Minor Outlying Islands','Uruguay','Uzbekistan',
      'Vatican City State (Holy See)','Saint Vincent and the Grenadines','Venezuela','British Virgin Islands',
      'Virgin Islands (U.S.)','Vietnam','Vanuatu','Wallis and Futuna Islands','Samoa','Yemen','Mayotte',
      'South Africa','Zambia','Zimbabwe']
      
    COUNTRY_CODE = k ['AC','AD','AE','AF','AG','AI','AL','AM','AN','AO','AR','AS','AT','AU','AW','AZ','BA','BB','BD',
      'BE','BF','BG','BH','BI','BJ','BM','BN','BO','BR','BS','BT','BV','BW','BY','BZ','CA','CD','CF','CG','CH','CI',
      'CK','CL','CM','CN','CO','CR','CU','CV','CX','CY','CZ','DE','DJ','DK','DM','DO','DZ','EC','EE','EG','ER','ES',
      'ET','FI','FJ','FK','FM','FO','FR','GA','GB','GD','GE','GF','GH','GI','GL','GM','GN','GP','GQ','GR','GS','GT',
      'GU','GW','GY','HK','HN','HR','HT','HU','ID','IE','IL','IM','IN','IO','IQ','IR','IS','IT','JE','JM','JO','JP',
      'KE','KG','KH','KI','KM','KN','KP','KR','KW','KY','KZ','LA','LB','LC','LI','LK','LR','LS','LT','LU','LV','LY',
      'MA','MC','MD','ME','MG','MH','MK','ML','MM','MN','MO','MP','MQ','MR','MS','MT','MU','MV','MW','MX','MY','MZ',
      'NA','NC','NE','NF','NG','NI','NL','NO','NP','NR','NU','NZ','OM','PA','PE','PF','PG','PH','PK','PL','PM','PN',
      'PR','PS','PT','PW','PY','QA','RE','RO','RS','RU','RW','SA','SB','SC','SD','SE','SG','SH','SI','SK','SL','SM',
      'SN','SO','SR','ST','SV','SY','SZ','TC','TD','TG','TH','TJ','TK','TM','TN','TO','TP','TR','TT','TV','TW','TZ',
      'UA','UG','UK','US','UY','UZ','VA','VC','VE','VG','VI','VN','VU','WF','WS','YE','YT','ZA','ZM','ZW']
    
  end
end
