create table domain (
  domainName varchar(32),
  factTableName varchar(32),
  primary key (domainName)
);
insert into domain values ('Colleges','collegeFactTable');
insert into domain values ('Automobiles','autoFactTable');

create table regularColumn (
  domainName varchar(32),
  columnName varchar(32),
  primary key (domainName,columnName)
);
insert into regularColumn values ('Colleges','name');
insert into regularColumn values ('Colleges','url');
insert into regularColumn values ('Automobiles','autoID');
insert into regularColumn values ('Automobiles','url');

create table property (
  domainName varchar(32),
  propertyName varchar(32),
  propertyQuestion  varchar(256),
  displayorder tinyint,
  propertyDisplayType varchar(16), -- radio, checkbox, singleselect, multiselect
  primary key (domainName,propertyName),
  foreign key (domainName) references domain(domainName)
);

create table propertyDetail (
  domainName varchar(32),
  propertyName varchar(32),
  allowedValue varchar(64),
  allowedValueCode int,
  primary key (domainName,propertyName,allowedValue),
  foreign key (domainName,propertyName) references property(domainName,propertyName)
);

create table user (
  userid    varchar(16),
  primary key (userid)
);
insert into user values ('raj');

create table userBookmark (
  userid    varchar(16),
  domainName varchar(32),
  bname varchar(16),
  bookmark  varchar(512),
  primary key (userid,domainName,bname),
  foreign key (domainName) references domain(domainName),
  foreign key (userid) references user(userid)
);

insert into userBookmark values ('raj','Colleges','fav1','publicOrPrivate=1,region=1,state=1,state=2');
insert into userBookmark values ('raj','Colleges','fav2','publicOrPrivate=1,region=1,state=1');
insert into userBookmark values ('raj','Colleges','fav3','publicOrPrivate=2,region=2,state=1,state=3');
insert into userBookmark values ('raj','Colleges','fav4','publicOrPrivate=2,region=2,state=1,state=3');
insert into userBookmark values ('raj','Colleges','favorite5','publicOrPrivate=2,region=2,state=1,state=3');

use mydb;
select * from domain;

delete from propertyDetail where domainName = 'Colleges';
delete from property where domainName = 'Colleges';
delete from userBookmarks where domainName = 'Colleges';


insert into property values 
  ('Colleges','publicOrPrivate','Do you like to attend a public or private university?',1,'radio');
insert into property values 
  ('Colleges','region','What region of the country do you prefer?',2,'checkbox');
insert into property values 
  ('Colleges','state','What state of the country do you prefer?',3,'multiselect');
insert into property values 
  ('Colleges','focus','Are you interested in schools with a specific focus?',4,'checkbox');
insert into property values 
  ('Colleges','setting','In what kind of setting are you interested?',5,'checkbox');
insert into property values 
  ('Colleges','collegeType','What type of college are you interested in?',6,'checkbox');
insert into property values 
  ('Colleges','collegeSize','What size college are you interested in?',7,'radio');
insert into property values 
  ('Colleges','SATAvg','What SAT Average school are you looking for?',8,'radio');
insert into property values 
  ('Colleges','collegeRanking','What ranking of schools are you searching for?',9,'radio');
insert into property values 
  ('Colleges','sportsTradition','Is collegiate sports tradition of interest to you?',10,'radio');
insert into property values 
  ('Colleges','studentFacultyRatio','How do you feel about student faculty ratios?',11,'radio');
insert into property values 
  ('Colleges','cost','What tuitions are you comfortable with?',12,'radio');
insert into property values 
  ('Colleges','collegeAge','Is college age of any concern to you?',13,'radio');


insert into propertyDetail values ('Colleges','publicOrPrivate','Public',1);
insert into propertyDetail values ('Colleges','publicOrPrivate','Private',2);

insert into propertyDetail values ('Colleges','region','Southeast',1);
insert into propertyDetail values ('Colleges','region','Midwest',2);
insert into propertyDetail values ('Colleges','region','East',3);
insert into propertyDetail values ('Colleges','region','West',4);

insert into propertyDetail values ('Colleges','state','Alabama',1);
insert into propertyDetail values ('Colleges','state','Arizona',2);
insert into propertyDetail values ('Colleges','state','California',3);
insert into propertyDetail values ('Colleges','state','Florida',4);
insert into propertyDetail values ('Colleges','state','Georgia',5);
insert into propertyDetail values ('Colleges','state','Illinois',6);
insert into propertyDetail values ('Colleges','state','Indiana',7);
insert into propertyDetail values ('Colleges','state','Iowa',8);
insert into propertyDetail values ('Colleges','state','Kansas',9);
insert into propertyDetail values ('Colleges','state','Kentucky',10);
insert into propertyDetail values ('Colleges','state','Louisiana',11);
insert into propertyDetail values ('Colleges','state','Maryland',12);
insert into propertyDetail values ('Colleges','state','Michigan',13);
insert into propertyDetail values ('Colleges','state','Minnesota',14);
insert into propertyDetail values ('Colleges','state','Missouri',15);
insert into propertyDetail values ('Colleges','state','Nevada',16);
insert into propertyDetail values ('Colleges','state','North Carolina',17);
insert into propertyDetail values ('Colleges','state','New Jersey',18);
insert into propertyDetail values ('Colleges','state','New Mexico',19);
insert into propertyDetail values ('Colleges','state','New York',20);
insert into propertyDetail values ('Colleges','state','Ohio',21);
insert into propertyDetail values ('Colleges','state','Pennsylvania',22);
insert into propertyDetail values ('Colleges','state','South Carolina',23);
insert into propertyDetail values ('Colleges','state','South Dakota',24);
insert into propertyDetail values ('Colleges','state','Tennessee',25);
insert into propertyDetail values ('Colleges','state','Texas',26);
insert into propertyDetail values ('Colleges','state','Utah',27);
insert into propertyDetail values ('Colleges','state','Vermont',28);
insert into propertyDetail values ('Colleges','state','Virginia',29);
insert into propertyDetail values ('Colleges','state','Washington',30);
insert into propertyDetail values ('Colleges','state','West Virginia',31);
insert into propertyDetail values ('Colleges','state','Wisconsin',32);
insert into propertyDetail values ('Colleges','state','Wyoming',33);

insert into propertyDetail values ('Colleges','focus','Men Only',1);
insert into propertyDetail values ('Colleges','focus','Women Only',2);
insert into propertyDetail values ('Colleges','focus','Military',3);
insert into propertyDetail values ('Colleges','focus','Religious',4);

insert into propertyDetail values ('Colleges','setting','Large City',1);
insert into propertyDetail values ('Colleges','setting','Small City',2);
insert into propertyDetail values ('Colleges','setting','Large Town',3);
insert into propertyDetail values ('Colleges','setting','Small Town',4);
insert into propertyDetail values ('Colleges','setting','Rural Area',5);

insert into propertyDetail values ('Colleges','collegeType','Liberal Arts',1);
insert into propertyDetail values ('Colleges','collegeType','Medical',2);
insert into propertyDetail values ('Colleges','collegeType','Law',3);
insert into propertyDetail values ('Colleges','collegeType','Engineering',4);

insert into propertyDetail values ('Colleges','collegeSize','Large (>20000 students)',1);
insert into propertyDetail values ('Colleges','collegeSize', 'Medium (5000-20000 students)',2);
insert into propertyDetail values ('Colleges','collegeSize','Small (<5000 students)',3);

insert into propertyDetail values ('Colleges','SATAvg','>1400',1);
insert into propertyDetail values ('Colleges','SATAvg','1200-1400',2);
insert into propertyDetail values ('Colleges','SATAvg','1000-1200',3);
insert into propertyDetail values ('Colleges','SATAvg','800-1000',4);
insert into propertyDetail values ('Colleges','SATAvg','<800',5);

insert into propertyDetail values ('Colleges','collegeRanking','Top 20',1);
insert into propertyDetail values ('Colleges','collegeRanking','20-50',2);
insert into propertyDetail values ('Colleges','collegeRanking','50-100',3);
insert into propertyDetail values ('Colleges','collegeRanking','100-200',4);
insert into propertyDetail values ('Colleges','collegeRanking','Others',5);

insert into propertyDetail values ('Colleges','sportsTradition','Excellent (won major championships)',1);
insert into propertyDetail values ('Colleges','sportsTradition','Good (competitive)',2);
insert into propertyDetail values ('Colleges','sportsTradition','Poor (not competitive)',3);

insert into propertyDetail values ('Colleges','studentFacultyRatio','Small classes (under 10:1)',1);
insert into propertyDetail values ('Colleges','studentFacultyRatio','Medium classes (10:1 to 20:1)',2);
insert into propertyDetail values ('Colleges','studentFacultyRatio','Larger classes (above 20:1)',3);

insert into propertyDetail values ('Colleges','cost','Upto $5000',1);
insert into propertyDetail values ('Colleges','cost','Upto $10000',2);
insert into propertyDetail values ('Colleges','cost','Upto $15000',3);
insert into propertyDetail values ('Colleges','cost','Upto $20000',4);
insert into propertyDetail values ('Colleges','cost','Above $30000',5);

insert into propertyDetail values ('Colleges','collegeAge','Old school - Established over 100 yrs ago',1);
insert into propertyDetail values ('Colleges','collegeAge','Established over 50 yrs ago',2);
insert into propertyDetail values ('Colleges','collegeAge','New College - establish in past 50 yrs',3);

SET FOREIGN_KEY_CHECKS = 0;
drop table collegeFactTable;
SET FOREIGN_KEY_CHECKS = 1;

create table collegeFactTable (
  name varchar(64),
  url varchar(256),
  publicOrPrivate int,
  region int,
  state int,
  focus int,
  setting int,
  collegeType int,
  collegeSize int,
  SATAvg int,
  collegeRanking int,
  sportsTradition int,
  studentFacultyRatio int,
  cost int,
  collegeAge int,
  primary key (name)
);

insert into collegeFactTable values('University of Southern Indiana Nursing Prg','http://www.usi.edu/gradstud/nursing.asp',2,2,7,0,1,4,0,1,0,0,1,4,0);
insert into collegeFactTable values('Butler University','http://www.butler.edu/academics/aca_education.asp',1,2,7,0,1,0,3,0,0,0,3,4,2);
insert into collegeFactTable values('Huntington College','http://www.huntington.edu/gscm/',1,2,7,0,2,0,0,1,0,0,2,5,2);
insert into collegeFactTable values('St. Mary of the Woods College','http://www.smwc.edu/',1,2,7,3,2,0,0,2,0,0,3,5,1);
insert into collegeFactTable values('Uni. of Southern Indiana Graduate Studies','http://www.usi.edu/gradstud/',2,2,7,0,1,1,2,0,0,2,2,3,2);
insert into collegeFactTable values('Uni. of Southern Indiana Graduate Nursing Prg.','http://www.usi.edu/gradstud/nursing.asp',2,2,7,0,1,4,2,0,0,2,2,1,1);
insert into collegeFactTable values('Uni. of Southern Indiana Industrial Mngmt.','http://www.usi.edu/gradstud/indust.asp',2,2,7,0,1,0,3,1,4,2,3,3,1);
insert into collegeFactTable values('Uni. of Southern Indiana Social Work','http://www.usi.edu/gradstud/social.asp',2,2,7,0,1,3,3,0,0,2,3,3,2);
insert into collegeFactTable values('Associated Mennonite Biblical Seminary','http://www.ambs.edu/',1,2,7,3,2,4,3,0,0,0,3,1,3);
insert into collegeFactTable values('Ball State University','http://www.bsu.edu/cfal',2,2,7,0,1,3,3,0,0,2,3,1,2);

INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Minnesota State Colleges and Universities', 'http://www.mnscu.edu', 1, 2, 14, 0, 1
, 1, 1, 2, 4, 2, 3, 2, 3); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Northwest Technical College', 'http://www.ntcmn.edu/', 0, 0, 14, 0, 4, 0, 3, 2, 5
, 2, 2, 3, 3); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'College of Saint Benedict', 'http://www.csbsju.edu', 1, 2, 14, 1, 4, 1, 3, 5, 1, 3
, 1, 4, 1); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'The University of St. Thomas', 'http://www.mnsu.edu', 1, 2, 14, 4, 5, 4, 2, 1, 5
, 2, 1, 3, 3); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Minnesota Private College', 'http://www.mnprivatecolleges.com', 2, 2, 14, 0, 4, 4
, 3, 1, 5, 3, 2, 5, 1); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Minnesota State University', 'http://www.mnsu.edu', 1, 2, 14, 0, 1, 1, 1, 3, 4, 1
, 3, 5, 2); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Hamline University', 'http://www.hamline.edu', 2, 2, 14, 0, 3, 3, 3, 3, 3, 2, 2, 4
, 1); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Bethel University', 'http://www.bethel.edu', 1, 2, 14, 0, 5, 1, 3, 4, 5, 3, 2, 3
, 1); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Metro State University ', 'http://www.metrostate.edu/', 1, 2, 14, 0, 1, 1, 2, 3, 5
, 2, 2, 5, 3); 
INSERT INTO collegeFactTable ( NAME, URL, PUBLICORPRIVATE, REGION, STATE, FOCUS, SETTING, COLLEGETYPE,
COLLEGESIZE, SATAVG, COLLEGERANKING, SPORTSTRADITION, STUDENTFACULTYRATIO, COST,
COLLEGEAGE ) VALUES ( 
'Dakota County Technical College', 'http://www.dctc.mnscu.edu', 1, 2, 14, 0, 4, 4
, 2, 5, 5, 3, 3, 4, 3); 

-- 10 Ohio colleges/universities
-- Dave Chen

insert into collegeFactTable values ('University of Akron','http://www.uakron.edu',1,2,21,0,2,0,1,3,5,2,2,2,1);
insert into collegeFactTable values ('Bowling Green State University','http://www.bgsu.edu',1,2,21,0,4,0,1,4,5,3,2,3,3);
insert into collegeFactTable values ('Cleveland State University','http://www.csuohio.edu',1,2,21,0,1,0,2,3,4,2,2,3,3);
insert into collegeFactTable values ('University of Cincinatti','http://www.uc.edu',1,2,21,0,1,0,1,3,3,2,2,4,1);
insert into collegeFactTable values ('Kent State University','http://www.kent.edu',1,2,21,0,3,1,1,3,4,2,2,2,2);
insert into collegeFactTable values ('Medical College of Ohio','http://www.mco.edu',1,2,21,0,2,2,3,3,5,3,1,5,3);
insert into collegeFactTable values ('The Ohio State University','http://www.osu.edu',1,2,21,0,1,0,1,3,2,1,3,3,1);
insert into collegeFactTable values ('Ohio University','http://www.ohio.edu',1,2,21,0,2,1,2,3,4,3,2,4,1);
insert into collegeFactTable values ('University of Toledo','http://www.utoledo.edu',1,2,21,0,2,0,1,3,5,2,2,3,1);
insert into collegeFactTable values ('Franklin University','http://www.franklin.edu',2,2,21,0,1,0,2,3,5,3,2,1,1);

-- Geoffrey Bays' Arizona facts for CSC8711--


insert into collegeFactTable values ('Arizona State University','http://www.asu.edu',1,4,2,0,1,0,1,3,4,1,3,1,1);
insert into collegeFactTable values ('Art Institute of Phoenix','http://www.aii.edu',2,4,2,0,1,1,3,2,5,0,2,4,3);
insert into collegeFactTable values ('Embry-Riddle Aeronautical Unversity','http://www.erau.edu',2,4,2,0,4,4,3,2,3,3,2,5,3);
insert into collegeFactTable values ('Grand Canyon University','http://www.gcu.edu',2,4,2,4,1,1,3,3,5,3,2,4,2);
insert into collegeFactTable values ('Northern Arizona University','http://www.nau.edu',1,4,2,0,4,0,2,3,5,2,2,1,1);
insert into collegeFactTable values ('University of Arizona','http://www.arizona.edu',1,4,2,0,2,0,1,3,3,1,2,1,1);
insert into collegeFactTable values ('University of Phoenix-Phoenix Campus','http://www.phoenix.edu',2,4,2,0,1,0,3,0,5,0,1,2,3);
insert into collegeFactTable values ('Prescott College','http://www.prescott.edu',2,4,2,0,4,1,3,3,5,3,2,4,3);
insert into collegeFactTable values ('Southwestern College','http://www.swcaz.edu',2,4,2,4,1,1,3,0,5,3,2,4,3);
insert into collegeFactTable values ('University of Advancing Technology','http://www.uact.edu',2,4,2,0,1,4,3,2,5,0,2,4,3);
insert into collegeFactTable values('Iowa State University','http://www.iastate.edu',1,2,8,2,1,3,2,1,1,1,2,1,2);

insert into collegeFactTable values('Iowa Wesleyan College','http://www.iwc.edu',1,2,8,3,2,1,2,2,2,3,2,2,3);

insert into collegeFactTable values('University of Iowa','http://www.uiowa.edu',1,2,8,2,1,3,1,3,3,3,1,2,1);

insert into collegeFactTable values('Univeristy of Northern owa','http://www.uni.edu',1,2,8,4,2,3,2,2,2,2,1,3,2);

insert into collegeFactTable values('Upper Iowa University','http://www.uiu.edu',1,2,8,2,1,1,2,1,1,2,1,5,1);

insert into collegeFactTable values('Northwestern College of Iowa','http://www.nwciowa.edu',1,2,8,1,2,1,3,2,2,1,3,4,2);

insert into collegeFactTable values('Briar Cliff College','http://www.briarcliff.edu',2,2,8,1,1,3,1,3,4,3,1,1,3);

insert into collegeFactTable values('Buena Vista University','http://www.bvu.edu',2,2,8,2,2,2,1,4,1,1,2,2,3);

insert into collegeFactTable values('Coe College','http://www.coe.edu',2,2,8,3,2,2,1,2,2,2,3,3,2);

insert into collegeFactTable values('Cornell College','http://www.cornell-iowa.edu',2,2,8,4,1,1,2,1,2,1,2,4,1);

insert into collegeFactTable values('Drake University','http://www.drake.edu',2,2,8,1,1,2,2,3,4,3,1,5,1);
insert into collegeFactTable values ('Kansas State University','http://www.ksu.edu',1,2,9,0,1,4,2,3,5,2,3,2,1);
insert into collegeFactTable values ('University of Kansas','http://www.ku.edu',1,2,9,0,2,4,2,3,5,2,2,3,1);
insert into collegeFactTable values ('Wichita State University','http://www.wichita.edu',1,2,9,0,2,4,2,0,5,0,2,3,1);
insert into collegeFactTable values ('Ottawa University','http://www.ottawa.edu',1,2,9,0,4,0,3,0,5,3,1,3,1);
insert into collegeFactTable values ('Kansas Wesleyan University','http://www.kwu.edu',2,2,9,0,4,0,3,3,5,3,2,4,1);
insert into collegeFactTable values ('Emporia State University','http://www.emporia.edu',1,2,9,0,4,0,3,0,5,3,0,4,1);
insert into collegeFactTable values ('Haskell Indian Nations University','http://www.haskell.edu',1,2,9,0,2,0,3,4,5,3,2,1,1);
insert into collegeFactTable values ('Friends University','http://www.friends.edu',2,2,9,0,2,1,3,3,5,3,2,4,1);
insert into collegeFactTable values ('Baker University','http://www.bakeru.edu',2,2,9,4,2,0,3,0,5,3,2,4,1);
insert into collegeFactTable values ('Pittsburg State University','http://www.pittstate.edu',1,2,9,0,2,0,2,3,5,3,0,1,1);

insert into collegeFactTable values ('University of Nevada-Reno','http://www.unr.edu',1,4,16,0,2,0,1,4,4,2,3,1,2); 
insert into collegeFactTable values ('University of Nevada-Las Vegas','http://www.unlv.edu',1,4,16,0,2,0,2,4,4,2,2,2,2); 
insert into collegeFactTable values ('Great Basin College','http://www.gbcnv.edu',1,4,16,0,2,0,3,5,5,2,1,2,3); 
insert into collegeFactTable values ('Nevada State College at Henderson','http://www.nsc.nevada.edu',1,4,16,0,2,0,3,5,5,2,1,2,3); 
insert into collegeFactTable values ('Sierra Nevada College','http://www.sierranevada.edu',2,4,16,0,2,0,3,5,5,2,1,2,3); 
insert into collegeFactTable values ('University of Southern Nevada','http://www.usn.edu/',2,4,16,0,2,0,3,5,5,2,1,2,3); 
insert into collegeFactTable values ('Deep Springs College ','http://www.deepsprings.edu/',2,4,16,1,2,1,3,5,5,2,1,1,3); 
insert into collegeFactTable values ('Morrison University','http://www.morrison.northface.edu/',2,4,16,0,2,0,2,5,5,2,2,1,1); 
insert into collegeFactTable values ('Desert Research Institute ','http://www.dri.edu/',1,4,16,0,2,0,3,5,5,2,2,1,3); 
insert into collegeFactTable values ('Las Vegas College ','http://www.lasvegas-college.com/',2,4,16,0,2,0,3,5,5,2,2,1,3); 
insert into collegeFactTable values('Clemson University','http://www.clemson.edu/',1,1,17,0,1,4,2,2,2,2,2,3,1);

insert into collegeFactTable values('Citadel Military College Of South Carolina','http://www.citadel.edu/',2,1,17,3,0,4,2,2,2,1,2,3,1);

insert into collegeFactTable values('Bob Jones University','http://www.bju.edu/',2,1,17,0,1,3,1,1,1,1,2,1,3);

insert into collegeFactTable values('South Carolina State University ','http://www.scsu.edu/',1,1,17,0,1,4,2,2,3,5,2,3,1);

insert into collegeFactTable values('Allen University','http://www.allenuniversity.edu/',2,1,17,0,5,4,2,4,2,1,2,1,1);

insert into collegeFactTable values('College of Charleston','http://www.cofc.edu/',1,1,17,0,4,2,2,5,1,2,3,3,2);

insert into collegeFactTable values('Newberry College','http://www.newberry.edu/',2,1,17,0,2,2,2,5,2,1,2,2,1);

insert into collegeFactTable values('Limestone College','http://www.limestone.edu/',1,1,17,0,4,4,2,1,5,2,3,3,1);

insert into collegeFactTable values('North Greenville College','http://www.ngc.edu/home/',2,1,17,0,1,1,2,2,2,2,3,3,2);

insert into collegeFactTable values('MorrisCollege','http://www2.morris.edu/index.asp',1,1,17,1,5,1,2,5,1,2,1,3,2);
insert into collegeFactTable values('Alice Lloyd College','http://www.alc.edu/',1,1,10,1,4,2,1,3,2,1,2,3,1);
insert into collegeFactTable values('Asbury College','http://www.asbury.edu/',1,1,10,1,4,2,0,4,5,2,4,1,2);
insert into collegeFactTable values('Bellarmine College','http://www.bellarmine.edu/',2,1,10,1,2,2,1,3,5,1,2,3,2);
insert into collegeFactTable values('Berea College','http://www.berea.edu/',1,1,10,1,5,2,2,1,4,1,3,2,3);
insert into collegeFactTable values('Brescia University','http://www.brescia.edu/',2,1,10,1,3,1,3,4,1,0,3,1,2);
insert into collegeFactTable values('Clear Creek Baptist Bible College','http://www.ccbbc.edu/',1,1,10,1,1,1,2,5,3,1,3,2,3);
insert into collegeFactTable values('Eastern Kentucky University','http://www.eku.edu/',2,1,10,1,5,1,1,2,5,2,1,2,1);
insert into collegeFactTable values('Kentucky State University','http://www.kysu.edu/',1,1,10,1,2,0,3,5,4,2,1,2,1);
insert into collegeFactTable values('Kentucky Wesleyan College','http://www.kwc.edu/',2,1,10,1,2,0,2,4,5,3,2,1,1);
insert into collegeFactTable values('Pikeville College','http://www.pc.edu/',2,1,10,1,3,2,1,4,4,3,3,2,2);

insert into collegeFactTable values ('North Carolina Agricultural and Technical State University', 'http://www.ncat.edu', 1, 3, 17, 0, 3, 4, 2, 5, 5, 0, 3, 3, 1);
insert into collegeFactTable values ('North Carolina Central University', 'http://www.nccu.edu', 1, 3, 17, 0, 3, 4, 2, 5, 5, 0, 2, 3, 2);
insert into collegeFactTable values ('North Carolina State University', 'http://www.ncsu.edu', 1, 3, 17, 0, 2, 4, 1, 3, 3, 1, 3, 4, 1);
insert into collegeFactTable values ('North Carolina Wesleyan College', 'http://www.ncwc.edu', 2, 3, 17, 0, 3, 4, 3, 5, 4, 3, 1, 4, 2);
insert into collegeFactTable values ('The University of North Carolina at Asheville', 'http://www.unca.edu', 1, 3, 17, 0, 2, 1, 3, 3, 5, 0, 1, 3, 2);
insert into collegeFactTable values ('The University of North Carolina at Chapel Hill', 'http://www.unc.edu', 1, 3, 17, 0, 2, 4, 1, 2, 4, 0, 3, 5, 1);
insert into collegeFactTable values ('The University of North Carolina at Charlotte ', 'http://www.uncc.edu', 1, 3, 17, 0, 1, 4, 2, 4, 3, 1, 2, 3, 2);
insert into collegeFactTable values ('The University of North Carolina at Greensboro', 'http://www.uncg.edu', 1, 3, 17, 0, 2, 4, 2, 3, 4, 0, 2, 3, 1);
insert into collegeFactTable values ('The University of North Carolina at Wilmington', 'http://www.uncw.edu', 1, 3, 17, 0, 2, 4, 2, 3, 4, 0, 2, 3, 2);
insert into collegeFactTable values ('North Carolina School of the Arts', 'http://www.ncarts.edu', 1, 3, 17, 0, 4, 1, 3, 5, 0, 0, 1, 3, 3);
insert into collegeFactTable values ('College Of New Jersy','http://www.tcnj.edu/',1,3,18,3,3,2,5,3,2,1,2,2,3);
insert into collegeFactTable values ('Kean University','http://www.kean.edu/',2,3,18,0,2,3,5,4,3,2,1,3,2);
insert into collegeFactTable values ('New Jersy Institue of technology','http://www.njit.edu/',1,3,18,0,4,4,3,2,1,3,2,4,3);
insert into collegeFactTable values ('Rutgers, The State Univeristy of New Jersy','http://www.rutgers.edu/',1,3,18,4,5,4,3,1,3,2,3,5,3);
insert into collegeFactTable values ('Brookdale Community College','http://www.brookdale.cc.nj.us/',2,3,18,3,2,3,2,1,1,1,1,3,1);
insert into collegeFactTable values ('Warren County COmmunity College','http://www.warren.edu/',2,3,18,1,4,2,1,3,3,2,2,5,1);
insert into collegeFactTable values ('Hudson County Community COllege','http://www.hccc.edu/',2,3,18,4,5,1,4,5,2,1,3,3,2);
insert into collegeFactTable values ('Monclair State University State University','http://www.montclair.edu/',2,3,18,4,2,3,3,2,3,2,1,3,2);
insert into collegeFactTable values ('Rowan State University','http://www.rowan.edu/',1,3,18,3,1,4,2,3,1,1,2,3,3);
insert into collegeFactTable values ('William Patterson University','http://ww2.wpunj.edu/',2,3,18,0,5,2,4,5,2,2,3,1,1);
insert into collegeFactTable values ('Ocean county college','http://www.ocean.edu/',2,3,18,3,3,1,1,5,1,3,1,2,2);





insert into collegeFactTable values('Tennessee Temple University','http://www.tntemple.edu',1,1,25,1,2,1,2,2,4,1,2,2,3);
insert into collegeFactTable values('University of Phoenix','http://latpa.com/clk/kaodaizhaizuozhe',1,1,25,2,3,2,1,3,2,2,1,1,2);
insert into collegeFactTable values('East Tennessee State University','http://www.etsu.edu',2,1,25,3,2,3,2,1,3,2,3,1,2);
insert into collegeFactTable values('Christian Brothers University','http://www.cbu.edu',1,1,25,4,3,2,1,2,2,1,3,2,1);
insert into collegeFactTable values('University of Memphis','http://www.memphis.edu',2,1,25,2,2,1,3,3,2,1,2,2,1);
insert into collegeFactTable values('Vanderbilt Unviersity','http://www.vanderbilt.edu',2,1,25,2,1,2,1,1,2,1,3,1,3);
insert into collegeFactTable values('The university of tennesse space institute','http://www.utsi.edu',1,1,25,3,1,2,3,2,3,1,2,1,3);
insert into collegeFactTable values('Union University','http://www.uu.edu',1,1,25,3,1,2,1,2,3,4,2,3,1);
insert into collegeFactTable values('Rhodes College','http://www.rhodes.edu',1,1,25,3,2,1,3,2,1,2,1,1,3);
insert into collegeFactTable values('University of Tennessee-memphis','http://www.utmem.edu',2,1,25,3,2,3,3,1,3,2,1,1,3);

-- --data.sql-------------------
insert into collegeFactTable values ('Georgia State University','http://www.gsu.edu',1,1,5,0,1,4,1,4,3,2,2,3,2);
insert into collegeFactTable values ('Emory University','http://www.emory.edu',2,1,5,4,1,2,2,2,2,1,2,5,1);
insert into collegeFactTable values ('Georgia Institute of Technology','http://www.gatech.edu',1,1,5,0,1,4,2,2,1,1,2,3,1);
insert into collegeFactTable values ('University of Georgia','http://www.uga.edu',1,1,5,0,2,1,1,2,2,1,2,2,1);
insert into collegeFactTable values ('Georgia Southern University','http://www.GeorgiaSouthern.edu',1,1,5,0,4,1,2,3,5,2,2,3,2);
insert into collegeFactTable values ('Agnes Scott College','http://www.agnesscott.edu',2,1,5,4,1,1,3,3,3,2,1,5,1);
insert into collegeFactTable values ('Oglethorpe University','http://wwww.oglethorpe.edu',2,1,5,0,1,1,3,3,5,2,1,5,1);
insert into collegeFactTable values ('Armstrong Atlantic State University','http://www.armstrong.edu',1,1,5,0,1,1,2,4,5,1,2,2,2);
insert into collegeFactTable values ('Valdosta State University','http://www.valdosta.edu',1,1,5,0,4,1,2,4,3,1,3,2,2);
insert into collegeFactTable values ('Piedmont College','http://www.piedmont.edu',2,1,5,4,5,1,3,4,5,1,2,4,1);
insert into collegeFactTable values ('Texas State University','http://www.txstate.edu',1,1,26,0,3,4,2,3,2,2,2,2,2);
insert into collegeFactTable values ('Texas Tech University','http://www.ttu.edu',1,1,26,0,5,3,1,4,4,3,3,4,3);
insert into collegeFactTable values ('Southwestern University','http://www.southwestern.edu',2,1,26,3,3,1,1,3,4,1,3,5,1);
insert into collegeFactTable values ('Schreiner University','http://www.schreiner.edu',2,1,26,0,4,2,3,4,3,2,2,5,3) ;
insert into collegeFactTable values ('The University of Texas at Dallas','http://www.utdallas.edu',1,1,26,0,1,2,2,2,2,3,2,2,3);
insert into collegeFactTable values ('University of St Thomas','http://www.stthom.edu',2,1,26,0,5,4,1,3,4,1,3,5,2);
insert into collegeFactTable values ('Amberton University','http://www.amberton.edu',2,1,26,0,2,3,3,5,3,3,1,3,3);
insert into collegeFactTable values ('University of North Texas','http://www.unt.edu',1,1,26,4,4,4,1,2,1,3,3,5,1);
insert into collegeFactTable values ('Trinity University','http://www.trinity.edu',2,1,26,0,2,1,3,1,3,1,2,5,2);
insert into collegeFactTable values ('The University of Texas at El Paso','http://www.utep.edu',1,1,26,0,5,3,2,4,4,3,3,1,1);
insert into collegeFactTable values ('Blackburn College','http://www.blackburn.edu',2,3,6,4,4,1,3,4,5,2,3,4,1);
insert into collegeFactTable values ('GreenVille College','http://www.greenville.edu',2,3,6,4,4,1,3,3,5,2,3,4,1);
insert into collegeFactTable values ('Illinois Institute of Technology','http://www.iit.edu',2,3,6,0,1,4,2,2,5,2,3,5,1);
insert into collegeFactTable values ('Western Illinois University','http://www.wiu.edu',1,3,6,0,1,4,2,0,5,2,3,2,2);
insert into collegeFactTable values ('University of Chicago','http://www.uchicago.edu',2,3,6,0,1,2,1,3,5,2,2,5,1);
insert into collegeFactTable values ('School of Art Institute of Chicago','http://www.artic.edu/saic',2,3,6,0,1,1,3,0,5,3,2,5,1);
insert into collegeFactTable values ('Roosevelt University','http://www.roosevelt.edu',2,3,6,0,1,0,2,3,4,3,2,4,2);
insert into collegeFactTable values ('Northwestern University','http://www.northwestern.edu',2,3,6,0,2,0,2,2,4,3,2,5,1);
insert into collegeFactTable values ('Midstate College','http://www.midstate.edu',2,3,6,0,2,0,3,0,5,3,1,2,1);
insert into collegeFactTable values ('North Park University','http://www.northpark.edu',2,3,6,4,1,0,3,0,5,3,1,5,1);

-- Data Entry Scrypt
insert into collegeFactTable values ('Calvin College','http://www.calvin.edu',2,2,13,4,2,1,3,3,1,3,2,4,1);
insert into collegeFactTable values ('Kalamazoo College','http://www.kzoo.edu',2,2,13,0,1,1,3,3,3,3,2,4,1);
insert into collegeFactTable values ('Michigan State University','http://www.egr.msu.edu',1,2,13,0,2,4,1,2,3,2,2,2,1);
insert into collegeFactTable values ('Michigan Technological University ','http://www.mtu.edu',1,2,13,0,1,4,2,2,1,3,2,4,1);
insert into collegeFactTable values ('University of Detroit Mercy','http://www.udmercy.edu',2,2,13,4,1,4,3,2,2,3,2,4,1);
insert into collegeFactTable values ('University of Michigan Dearborn','http://www.umd.umich.edu',1,2,13,0,2,4,2,2,4,2,2,3,3);
insert into collegeFactTable values ('University of Michigan Ann Arbor','http://www.umich.edu',1,2,13,0,1,0,1,2,2,2,2,2,1);
insert into collegeFactTable values ('Wayne State University','http://www.wayne.edu',1,2,13,0,1,0,1,3,5,3,2,3,1);
insert into collegeFactTable values ('Davenport University','http://www.davenport.edu',2,2,13,0,1,0,2,3,5,3,2,2,1);
insert into collegeFactTable values ('Northern Michigan University','http://www.nmu.edu/',1,2,13,0,1,0,2,3,3,2,2,2,1);
insert into collegeFactTable values ('Adelphi University,Garden City', 'http://www.adelphi.edu',1,3,20,0,2,0,2,3,4,0,2,4,1);
insert into collegeFactTable values ('Barnard College, New York', 'http://www.barnard.edu',2,3,20,2,1,1,3,2,1,3,1,5,1);
insert into collegeFactTable values ('Cornell University', 'http://www.cornell.edu',2,3,20,0,4,0,2,2,1,2,1,5,1);
insert into collegeFactTable values ('New York University, New York','http://www.nyu.edu', 1,3,20,0,1, 0,1,2,2,2,1,5,1);
insert into collegeFactTable values ('St. Bonaventure University', 'http://www.sbu.edu',2,3,20,4,4,0,3,3,4,3,0,4,1);
insert into collegeFactTable values ('State University of New York College at Brockport','http://www.brockport.edu',1,3,20,0,4,0,2,3,4,2,0,1,1);
insert into collegeFactTable values ('United States Military Academy','http://admissions.usma.edu',1,3,20,3,4,0,3,2,0,0,1,0,1);
insert into collegeFactTable values ('University of Rochester','http://www.rochester.edu',2,3,20,0,5,0,2,2,2,1,2,5,1);
insert into collegeFactTable values ('York College of the City University of New York','http://www.york.cuny.edu',2,3,20,0,2,0,2,4,5,3,3,1,3);
insert into collegeFactTable values ('North Country Community College,Saranac Lake, New York','http://www.nccc.edu',1,3,20,0,5,0,3,5,5,3,3,1,3);
insert into collegeFactTable values ('Long Island Business Institute',null,2,3,20,1,4,0,3,5,5,3,3,2,3); 
insert into collegeFactTable values ('Hamilton College','http://www.hamilton.edu',2,3,20,0,4,1,3,2,0,0,0,5,1); 
insert into collegeFactTable values ('Fordham University', 'http://www.fordham.edu',2,3,20,0,4,0,2,2,3,1,2,5,1);

insert into collegeFactTable values ('Capella University','http://www.clk4.com',2,1,11,0,1,0,2,4,5,3,2,3,3);

insert into collegeFactTable values ('Louisiana State Univ Ag Mech Hebert Laws Ctr','http://www.lsu.edu',1,1,11,0,2,3,2,3,5,3,2,3,3);

insert into collegeFactTable values ('Louisiana Tech University','http://www.latech.edu',1,1,11,0,2,4,2,2,4,2,2,3,3);

insert into collegeFactTable values ('Loyola University New Orleans','http://www.loyno.edu',2,1,11,0,1,0,3,5,5,2,3,1,2);

insert into collegeFactTable values ('New Orleans Baptist Theological Seminary','http://www.nobts.edu',2,1,11,4,1,0,2,3,5,3,2,1,2);

insert into collegeFactTable values ('Northwestern State University of Louisiana','http://www.nsula.edu',1,1,11,0,1,0,2,2,5,3,2,3,2);

insert into collegeFactTable values ('Southeastern Louisiana University','http://www.selu.edu',1,1,11,0,1,0,2,3,4,2,2,2,1);

insert into collegeFactTable values ('University of Louisiana at Monroe','http://www.ulm.edu',1,1,11,0,2,0,2,4,5,2,2,2,1);

insert into collegeFactTable values ('University of New Orleans','http://www.uno.edu',1,1,11,0,1,0,2,4,5,2,2,2,1);

insert into collegeFactTable values ('Our Lady of the Lake College','http://www.ololcollege.edu',2,1,11,0,2,2,3,2,3,2,2,2,1);

insert into collegeFactTable values ('Florida International University','http://www.fiu.edu/',1,1,4,0,4,4,3,3,2,2,2,2,3);

insert into collegeFactTable values ('Southeastern College','http://www.secollege.edu/',1,1,4,0,2,1,2,3,4,2,3,1,3);

insert into collegeFactTable values ('Eckerd College','http://www.eckerd.edu/',2,1,4,0,2,1,3,3,2,3,3,2,2);

insert into collegeFactTable values ('Florida Atlantic University','http://www.fau.edu/',1,1,4,1,1,2,1,2,3,2,3,4,2);

insert into collegeFactTable values ('University Of Miami','http://www.miami.edu/',2,1,4,0,1,1,1,3,2,2,2,3,2);

insert into collegeFactTable values ('Florida Southern College','http://www.flsouthern.edu/',2,1,4,1,3,4,2,4,2,2,2,4,1);

insert into collegeFactTable values ('Florida Memorial College','http://www.fmc.edu/',2,1,4,3,4,4,2,2,5,3,3,3,3);

insert into collegeFactTable values ('Florida Institiute Of Technology','http://www.fit.edu/',2,1,4,1,3,4,1,1,2,2,2,4,3);

insert into collegeFactTable values ('Florida Hospital College Of Health Science','http://www.fhchs.edu/',2,1,4,0,4,2,2,3,4,3,2,1,3);

insert into collegeFactTable values ('Florida College','http://www.flcoll.edu/',2,1,4,0,1,1,2,5,3,2,1,1,2);

insert into collegeFactTable values('Stanford University','http://www.stanford.edu',2,4,3,0,5,4,1,1,1,2,2,4,1);
insert into collegeFactTable values('University of California at Berkeley','http://www.berkeley.edu',1,4,3,0,3,4,1,1,1,2,1,3,1);
insert into collegeFactTable values('University of California at Los Angeles','http://www.ucla.edu',1,4,3,0,1,4,1,1,1,1,1,5,1);
insert into collegeFactTable values('California Institute of Technology','http://www.caltech.edu',2,4,3,0,3,4,1,1,1,1,2,4,1);
insert into collegeFactTable values('California State University at Fresno','http://www.csufresno.edu', 1,4,3,0,4,1,2,2,4,2,3,3,2);
insert into collegeFactTable values('California State University at Los Angeles','http://www.calstatela.edu',1,4,3,0,1,1,2,3,5,3,3,3,2);
insert into collegeFactTable values('Saint Marys College of California','http://www.stmarys-ca.edu',1,4,3,4,4,1,2,3,5,2,3,3,1);
insert into collegeFactTable values('John F. Kennedy University','http://www.jfku.edu',2,4,3,0,4,1,2,4,5,2,3,4,2);
insert into collegeFactTable values('Fielding Graduate Institute','http://www.fielding.edu',2,2,3,1,3,3,3,3,5,2,2,4,2);
insert into collegeFactTable values('Naval Postgraduate School','http://www.nps.navy.mil',1,4,3,3,4,4,3,4,5,1,1,2,2);
insert into collegeFactTable values('DeVry University-Long Beach','http://www.lb.devry.edu',2,4,3,0,3,2,3,3,5,3,1,2,3);

insert into collegeFactTable values ('University of Alabama','http://www.ua.edu/',1,1,1,0,2,0,1,3,4,2,3,2,1);
insert into collegeFactTable values (' University of Alabama at Birmingham','http://main.uab.edu/',1,1,1,0,4,0,2,4,4,3,2,2,1);
insert into collegeFactTable values ('University of South Alabama','http://www.southalabama.edu/',1,1,1,0,5,2,2,2,3,3,2,3,2);
insert into collegeFactTable values('University of North Alabama','http://www.una.edu/',1,1,1,0,4,0,1,3,3,2,2,3,1);
insert into collegeFactTable values('University of Alabama at Huntsville','http://www.uah.edu/',1,1,1,0,3,0,1,3,5,3,2,3,1);
insert into collegeFactTable values ('Alabama State University','http://www.alasu.edu/',1,1,1,0,4,0,2,3,4,3,2,3,3);
insert into collegeFactTable values ('Auburn University','http://www.auburn.edu/',1,1,1,0,4,0,1,2,2,1,3,3,1);
insert into collegeFactTable values ('University of West Alabama','http://www.uwa.edu/',1,1,1,0,4,0,2,4,3,3,3,2,1);
insert into collegeFactTable values('University of Montevallo','http://www.montevallo.edu/',1,1,1,0,3,1,3,5,5,3,2,2,1);
insert into collegeFactTable values ('Judson College','http://www.judson.edu/',1,1,1,2,4,1,3,4,3,5,3,1,1);

insert into collegeFactTable values('University of Pennsylvania','http://www.upenn.edu',1,4,22,1,1,4,1,1,1,2,3,4,2);
insert into collegeFactTable values('University of Pittsburgh','http://www.pitt.edu',1,4,22,2,1,1,2,3,1,2,3,2,3);
insert into collegeFactTable values('WestMinster','http://www.westminster.edu/',2,4,22,3,4,2,2,3,4,1,2,1,1);
insert into collegeFactTable values('Carnegie Mellon','http://www.cmu.edu/',2,4,22,3,4,2,1,1,3,3,1,3,2) ;
insert into collegeFactTable values('Lafayette College','http://www.lafayette.edu/',2,4,22,3,2,2,1,2,3,4,3,1,2);
insert into collegeFactTable values('Lehigh University','http://www3.lehigh.edu/default.asp',1,2,22,3,4,2,3,1,2,3,1,2,1);
insert into collegeFactTable values('Temple University','http://www.temple.edu/',2,1,22,3,1,1,2,2,1,2,1,1,3);
insert into collegeFactTable values('Rosemont College','http://www.rosemont.edu/',1,1,22,1,2,1,1,2,1,4,2,1,2);
insert into collegeFactTable values('Bucknell University','http://www.bucknell.edu',1,3,22,2,2,4,3,2,1,4,2,2,1);
insert into collegeFactTable values('Wilson College','http://www.wilson.edu/',2,2,22,1,2,3,1,2,1,2,4,2,3);

insert into collegeFactTable values ('The University of South Dakota','http://www.usd.edu/',1,2,24,0,2,0,1,3,4,2,2,1,1);

insert into collegeFactTable values ('Western Dakota Technical Institute','http://westerndakotatech.org/',1,2,24,0,2,4,4,2,4,5,3,2,3);

insert into collegeFactTable values ('University of Sioux Falls','http://www.usiouxfalls.edu/',2,2,24,0,2,4,4,3,4,5,3,1,3);

insert into collegeFactTable values ('Augustana College','http://www.augie.edu/',2,2,24,0,2,1,4,3,4,5,3,1,3); 

insert into collegeFactTable values ('Colorado Technical University','http://www.ctusiouxfalls.com/',2,2,24,0,2,4,1,3,4,5,3,1,3);

insert into collegeFactTable values ('Mount Marty College','http://www.mtmc.edu/',2,2,24,0,2,1,1,3,4,5,3,1,3);

insert into collegeFactTable values ('Oglala Lakota College','http://www.olc.edu/',2,2,24,0,2,4,1,3,4,5,3,1,3);

insert into collegeFactTable values ('South Dakota School of Mines and Technology','http://www.hpcnet.org/',1,2,24,0,2,4,1,3,4,5,3,1,3);

insert into collegeFactTable values ('Southeast Technical Insitute','http://www.southeasttech.com/',1,2,24,0,2,4,1,3,4,5,3,1,3);

insert into collegeFactTable values ('Mitchell Technical Insitute','http://mti.tec.sd.us/',1,2,24,0,2,4,1,3,4,5,3,1,3);

INSERT INTO collegeFactTable VALUES('Southern Utah University', 'http://www.suu.edu/', 1, 4, 27, 0, 1, 0, 2, 3, 2, 3, 3, 3, 1);
INSERT INTO collegeFactTable VALUES('The University of Utah', 'http://www.utah.edu/', 1, 4, 27, 0, 1, 0 , 1, 2, 1, 2, 1, 4, 1);
INSERT INTO collegeFactTable VALUES('Utah State University', 'http://www.usu.edu/', 1, 4, 27, 0, 1, 4, 1, 1, 2, 1, 3, 4, 1);
INSERT INTO collegeFactTable VALUES('Salt Lake Community College', 'http://www.slcc.edu/', 1, 4, 27, 0, 1, 0, 1, 3, 5, 2, 2, 2, 3);
INSERT INTO collegeFactTable VALUES('Weber State University', 'http://www.weber.edu/', 1, 4, 27, 0, 2, 0, 2, 4, 3, 3, 3, 1, 1);
INSERT INTO collegeFactTable VALUES('College of Eastern Utah', 'http://www.ceu.edu/', 1, 4, 27, 0, 2, 1 , 2, 4, 4, 3, 3, 1, 3);
INSERT INTO collegeFactTable VALUES('UNIVERSITY OF UTAH UTE WARRIOR BATTALION', 'http://www.milsci.utah.edu/', 1, 4, 27, 3, 1, 0, 3, 5, 5, 3, 1, 1, 1);
INSERT INTO collegeFactTable VALUES('BRIGHAM YOUNG UNIVERSITY', 'http://www.byu.edu/', 2, 4, 27, 4, 2, 2, 1, 1, 2, 2, 2, 4, 1);
INSERT INTO collegeFactTable VALUES('University of Utah - College of Law', 'http://www.law.utah.edu/', 1, 4, 27, 0, 1, 3, 1, 3, 2, 1, 2, 4, 1);
INSERT INTO collegeFactTable VALUES('University of Utah School of Medicine', 'http://uuhsc.utah.edu/som/', 1, 4, 27, 0, 1, 2, 1, 1, 2, 1, 2, 4, 1);
delete from propertyDetail where domainName = 'Automobiles';
delete from property where domainName = 'Automobiles';
delete from userBookmarks where domainName = 'Automobiles';
--
--
insert into property values 
  ('Automobiles','usedOrNew','Which cars are you interested in?',1,'checkbox');
insert into property values 
  ('Automobiles','bodyStyle','Which body styles are you considering?',2,'multiselect');
insert into property values 
  ('Automobiles','make','Which manufacturer are you considering?',3,'multiselect');
insert into property values 
  ('Automobiles','age','What age cars are you considering?',4,'radio');
insert into property values 
  ('Automobiles','priceRange','What price range are you looking for?',5,'radio');
insert into property values 
  ('Automobiles','sellerType','Which sellers do you prefer?',6,'radio');
insert into property values 
  ('Automobiles','mileage','What mileage are you looking for?',7,'radio');
insert into property values 
  ('Automobiles','color','What exterior color do you prefer?',8,'select');
insert into property values 
  ('Automobiles','sunroof','Do you need a Sunroof?',9,'radio');
insert into property values 
  ('Automobiles','luxurySeats','Do you need Luxury Seats?',10,'radio');
insert into property values 
  ('Automobiles','transmission','What transmission do you prefer?',11,'radio');
insert into property values 
  ('Automobiles','fuelType','What fuel type do you prefer?',12,'checkbox');
--
--
insert into propertyDetail values ('Automobiles','usedOrNew','New Cars',1);
insert into propertyDetail values ('Automobiles','usedOrNew','Used Cars',2);
insert into propertyDetail values ('Automobiles','usedOrNew','Certified Cars',3);
--
insert into propertyDetail values ('Automobiles','bodyStyle','Convertible',1);
insert into propertyDetail values ('Automobiles','bodyStyle','Coupe',2);
insert into propertyDetail values ('Automobiles','bodyStyle','Hatchback',3);
insert into propertyDetail values ('Automobiles','bodyStyle','Sedan',4);
insert into propertyDetail values ('Automobiles','bodyStyle','SUV',5);
insert into propertyDetail values ('Automobiles','bodyStyle','Truck',6);
insert into propertyDetail values ('Automobiles','bodyStyle','Van',7);
insert into propertyDetail values ('Automobiles','bodyStyle','Wagon',8);
--
insert into propertyDetail values ('Automobiles','make','Acura',1);
insert into propertyDetail values ('Automobiles','make','Audi',2);
insert into propertyDetail values ('Automobiles','make','Bentley',3);
insert into propertyDetail values ('Automobiles','make','BMW',4);
insert into propertyDetail values ('Automobiles','make','Ford',5);
insert into propertyDetail values ('Automobiles','make','Honda',6);
insert into propertyDetail values ('Automobiles','make','Hyundai',7);
insert into propertyDetail values ('Automobiles','make','Mazda',8);
insert into propertyDetail values ('Automobiles','make','Nissan',9);
insert into propertyDetail values ('Automobiles','make','Saab',10);
insert into propertyDetail values ('Automobiles','make','Toyota',11);
insert into propertyDetail values ('Automobiles','make','Volkswagen',12);
--
insert into propertyDetail values ('Automobiles','age','Less than 2 years old',1);
insert into propertyDetail values ('Automobiles','age','Between 2 and 5 years old',2);
insert into propertyDetail values ('Automobiles','age','Between 5 and 10 years old',3);
insert into propertyDetail values ('Automobiles','age','More than 10 years old',4);
--
insert into propertyDetail values ('Automobiles','priceRange','Less than $12,000',1);
insert into propertyDetail values ('Automobiles','priceRange','Between $12,000 and $18,000',2);
insert into propertyDetail values ('Automobiles','priceRange','Between $18,000 and $30,000',3);
insert into propertyDetail values ('Automobiles','priceRange','More than $30,000',4);
--
insert into propertyDetail values ('Automobiles','sellerType','Dealers',1);
insert into propertyDetail values ('Automobiles','sellerType','Private Seller',2);
--
insert into propertyDetail values ('Automobiles','mileage','Less than 15,000',1);
insert into propertyDetail values ('Automobiles','mileage','Less than 30,000',2);
insert into propertyDetail values ('Automobiles','mileage','Less than 45,000',3);
insert into propertyDetail values ('Automobiles','mileage','Less than 60,000',4);
insert into propertyDetail values ('Automobiles','mileage','More than 60,000',5);
--
insert into propertyDetail values ('Automobiles','color','Beige',1);
insert into propertyDetail values ('Automobiles','color','Black',2);
insert into propertyDetail values ('Automobiles','color','Blue',3);
insert into propertyDetail values ('Automobiles','color','Brown',4);
insert into propertyDetail values ('Automobiles','color','Burgundy',5);
insert into propertyDetail values ('Automobiles','color','Charcoal',6);
insert into propertyDetail values ('Automobiles','color','Gold',7);
insert into propertyDetail values ('Automobiles','color','Gray',8);
insert into propertyDetail values ('Automobiles','color','Green',9);
insert into propertyDetail values ('Automobiles','color','Orange',10);
insert into propertyDetail values ('Automobiles','color','Pink',11);
insert into propertyDetail values ('Automobiles','color','Red',12);
insert into propertyDetail values ('Automobiles','color','Silver',13);
insert into propertyDetail values ('Automobiles','color','Tan',14);
insert into propertyDetail values ('Automobiles','color','Turquoise',15);
insert into propertyDetail values ('Automobiles','color','White',16);
--
insert into propertyDetail values ('Automobiles','sunroof','Yes',1);
insert into propertyDetail values ('Automobiles','sunroof','No',2);
--
insert into propertyDetail values ('Automobiles','luxurySeats','Yes',1);
insert into propertyDetail values ('Automobiles','luxurySeats','No',2);
--
insert into propertyDetail values ('Automobiles','transmission','Automatic',1);
insert into propertyDetail values ('Automobiles','transmission','Manual',2);
--
insert into propertyDetail values ('Automobiles','fuelType','Alternative',1);
insert into propertyDetail values ('Automobiles','fuelType','Gasoline',2);
insert into propertyDetail values ('Automobiles','fuelType','Diesel',3);
--
--
SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;
--
create table autoFactTable (
  autoID varchar(64),
  url varchar(256), -- can be a URL to a description page including a photo
  usedOrNew int,
  bodyStyle int,
  make int,
  age int,
  priceRange int,
  sellerType int,
  mileage int,
  color int,
  sunroof int,
  luxurySeats int,
  transmission int,
  fuelType int,
  primary key (autoID)
);
--

insert into autoFactTable values ("a0","https://www.carvana.com/vehicle/2169335",3,4,6,3,2,1,3,2,2,1,1,3);
insert into autoFactTable values ("a1","https://www.carvana.com/vehicle/2169335",2,4,10,1,1,2,2,16,1,2,1,2);
insert into autoFactTable values ("a2","https://www.carvana.com/vehicle/2169335",3,4,10,2,2,1,5,10,2,2,1,3);
insert into autoFactTable values ("a3","https://www.carvana.com/vehicle/2169335",3,7,6,1,4,1,3,5,2,2,1,1);
insert into autoFactTable values ("a4","https://www.carvana.com/vehicle/2169335",1,2,6,3,4,1,2,3,2,1,1,1);
insert into autoFactTable values ("a5","https://www.carvana.com/vehicle/2169335",1,7,8,1,4,1,1,11,2,2,2,1);
insert into autoFactTable values ("a6","https://www.carvana.com/vehicle/2169335",1,8,3,3,3,2,5,12,2,2,1,2);
insert into autoFactTable values ("a7","https://www.carvana.com/vehicle/2169335",2,2,7,1,3,1,1,16,2,2,1,1);
insert into autoFactTable values ("a8","https://www.carvana.com/vehicle/2169335",1,5,10,4,2,1,5,14,2,1,1,2);
insert into autoFactTable values ("a9","https://www.carvana.com/vehicle/2169335",1,2,5,2,1,2,4,12,2,2,1,1);
insert into autoFactTable values ("a10","https://www.carvana.com/vehicle/2169335",1,5,10,1,1,2,3,2,2,1,1,2);
insert into autoFactTable values ("a11","https://www.carvana.com/vehicle/2169335",3,2,11,4,2,1,3,8,2,1,2,1);
insert into autoFactTable values ("a12","https://www.carvana.com/vehicle/2169335",3,1,4,2,2,1,2,3,2,1,2,3);
insert into autoFactTable values ("a13","https://www.carvana.com/vehicle/2169335",3,2,5,4,4,2,3,7,1,1,2,1);
insert into autoFactTable values ("a14","https://www.carvana.com/vehicle/2169335",3,5,3,2,1,1,1,10,2,2,1,1);
insert into autoFactTable values ("a15","https://www.carvana.com/vehicle/2169335",1,8,1,4,4,2,1,12,2,1,2,2);
insert into autoFactTable values ("a16","https://www.carvana.com/vehicle/2169335",2,8,4,2,1,2,5,4,2,2,2,2);
insert into autoFactTable values ("a17","https://www.carvana.com/vehicle/2169335",2,1,6,4,2,1,3,16,1,2,2,2);
insert into autoFactTable values ("a18","https://www.carvana.com/vehicle/2169335",1,2,12,4,1,2,3,14,1,1,2,1);
insert into autoFactTable values ("a19","https://www.carvana.com/vehicle/2169335",1,5,11,3,3,2,2,10,1,1,1,3);
insert into autoFactTable values ("a20","https://www.carvana.com/vehicle/2169335",2,7,7,1,2,1,2,9,1,2,2,1);
insert into autoFactTable values ("a21","https://www.carvana.com/vehicle/2169335",1,8,4,4,2,2,4,1,2,1,1,1);
insert into autoFactTable values ("a22","https://www.carvana.com/vehicle/2169335",2,2,8,1,4,2,4,16,1,1,2,1);
insert into autoFactTable values ("a23","https://www.carvana.com/vehicle/2169335",3,1,7,3,2,1,3,8,2,2,2,3);
insert into autoFactTable values ("a24","https://www.carvana.com/vehicle/2169335",2,5,7,4,3,1,2,15,2,2,2,3);
insert into autoFactTable values ("a25","https://www.carvana.com/vehicle/2169335",1,3,3,2,3,1,5,15,2,2,2,3);
insert into autoFactTable values ("a26","https://www.carvana.com/vehicle/2169335",1,1,2,1,3,1,3,9,1,1,2,2);
insert into autoFactTable values ("a27","https://www.carvana.com/vehicle/2169335",2,3,8,4,1,1,4,13,2,2,2,3);
insert into autoFactTable values ("a28","https://www.carvana.com/vehicle/2169335",2,4,2,1,4,2,1,12,2,2,2,2);
insert into autoFactTable values ("a29","https://www.carvana.com/vehicle/2169335",1,2,8,1,3,2,5,5,2,2,1,1);
insert into autoFactTable values ("a30","https://www.carvana.com/vehicle/2169335",1,5,11,2,2,1,1,6,2,1,2,1);
insert into autoFactTable values ("a31","https://www.carvana.com/vehicle/2169335",1,3,7,2,2,1,2,2,2,2,2,1);
insert into autoFactTable values ("a32","https://www.carvana.com/vehicle/2169335",1,6,4,3,4,1,3,1,1,2,1,2);
insert into autoFactTable values ("a33","https://www.carvana.com/vehicle/2169335",3,7,7,4,2,2,2,14,2,1,1,3);
insert into autoFactTable values ("a34","https://www.carvana.com/vehicle/2169335",2,6,9,3,2,1,3,1,1,2,2,2);
insert into autoFactTable values ("a35","https://www.carvana.com/vehicle/2169335",3,5,9,2,4,1,5,9,2,1,2,3);
insert into autoFactTable values ("a36","https://www.carvana.com/vehicle/2169335",1,6,8,1,1,1,2,6,2,1,2,3);
insert into autoFactTable values ("a37","https://www.carvana.com/vehicle/2169335",2,6,8,2,4,2,5,10,1,1,2,3);
insert into autoFactTable values ("a38","https://www.carvana.com/vehicle/2169335",1,1,1,4,4,1,1,3,2,1,2,1);
insert into autoFactTable values ("a39","https://www.carvana.com/vehicle/2169335",3,4,11,3,1,1,4,9,1,2,2,2);
insert into autoFactTable values ("a40","https://www.carvana.com/vehicle/2169335",1,8,1,4,1,2,3,8,1,2,1,2);
insert into autoFactTable values ("a41","https://www.carvana.com/vehicle/2169335",1,8,9,1,1,2,4,1,2,1,1,1);
insert into autoFactTable values ("a42","https://www.carvana.com/vehicle/2169335",3,6,1,1,3,1,1,10,2,1,1,2);
insert into autoFactTable values ("a43","https://www.carvana.com/vehicle/2169335",3,1,1,1,3,1,5,12,2,1,1,1);
insert into autoFactTable values ("a44","https://www.carvana.com/vehicle/2169335",3,6,8,4,1,2,2,13,2,2,2,2);
insert into autoFactTable values ("a45","https://www.carvana.com/vehicle/2169335",3,4,12,4,1,2,1,15,2,1,1,2);
insert into autoFactTable values ("a46","https://www.carvana.com/vehicle/2169335",2,5,7,1,1,1,5,2,2,1,1,2);
insert into autoFactTable values ("a47","https://www.carvana.com/vehicle/2169335",3,1,7,3,3,1,2,14,2,2,1,1);
insert into autoFactTable values ("a48","https://www.carvana.com/vehicle/2169335",1,2,10,3,1,1,3,4,2,1,2,3);
insert into autoFactTable values ("a49","https://www.carvana.com/vehicle/2169335",3,1,9,2,3,1,2,4,2,1,1,3);
insert into autoFactTable values ("a50","https://www.carvana.com/vehicle/2169335",3,4,2,3,2,2,3,14,2,2,2,1);
insert into autoFactTable values ("a51","https://www.carvana.com/vehicle/2169335",3,4,9,2,4,2,3,11,1,2,2,2);
insert into autoFactTable values ("a52","https://www.carvana.com/vehicle/2169335",1,2,4,1,1,2,4,8,2,1,1,3);
insert into autoFactTable values ("a53","https://www.carvana.com/vehicle/2169335",1,3,6,3,1,2,1,14,1,1,2,2);
insert into autoFactTable values ("a54","https://www.carvana.com/vehicle/2169335",1,8,4,1,1,1,2,15,2,1,1,3);
insert into autoFactTable values ("a55","https://www.carvana.com/vehicle/2169335",2,7,7,4,3,1,5,3,1,2,2,2);
insert into autoFactTable values ("a56","https://www.carvana.com/vehicle/2169335",3,1,1,4,3,2,5,15,1,1,1,2);
insert into autoFactTable values ("a57","https://www.carvana.com/vehicle/2169335",2,5,11,2,4,2,4,8,2,2,1,2);
insert into autoFactTable values ("a58","https://www.carvana.com/vehicle/2169335",2,5,3,2,2,1,3,1,1,1,2,1);
insert into autoFactTable values ("a59","https://www.carvana.com/vehicle/2169335",2,1,12,3,3,1,5,5,1,1,2,2);
insert into autoFactTable values ("a60","https://www.carvana.com/vehicle/2169335",2,8,6,1,3,1,1,10,1,1,1,1);
insert into autoFactTable values ("a61","https://www.carvana.com/vehicle/2169335",2,1,7,2,2,2,2,4,2,2,2,1);
insert into autoFactTable values ("a62","https://www.carvana.com/vehicle/2169335",1,8,4,3,4,1,3,11,1,1,1,1);
insert into autoFactTable values ("a63","https://www.carvana.com/vehicle/2169335",3,4,2,2,2,2,4,4,2,2,2,3);
insert into autoFactTable values ("a64","https://www.carvana.com/vehicle/2169335",2,1,5,1,3,2,2,3,1,1,1,3);
insert into autoFactTable values ("a65","https://www.carvana.com/vehicle/2169335",1,5,4,1,3,1,5,6,1,2,1,3);
insert into autoFactTable values ("a66","https://www.carvana.com/vehicle/2169335",2,2,9,2,3,1,4,1,2,2,1,1);
insert into autoFactTable values ("a67","https://www.carvana.com/vehicle/2169335",2,6,7,2,3,2,3,4,2,1,2,1);
insert into autoFactTable values ("a68","https://www.carvana.com/vehicle/2169335",2,2,7,2,3,1,3,5,1,1,1,2);
insert into autoFactTable values ("a69","https://www.carvana.com/vehicle/2169335",3,1,9,1,4,2,5,1,1,2,1,2);
insert into autoFactTable values ("a70","https://www.carvana.com/vehicle/2169335",2,4,2,1,4,2,1,7,2,2,2,2);
insert into autoFactTable values ("a71","https://www.carvana.com/vehicle/2169335",2,6,11,2,4,2,1,14,2,1,2,2);
insert into autoFactTable values ("a72","https://www.carvana.com/vehicle/2169335",1,1,1,2,2,1,2,16,2,2,1,1);
insert into autoFactTable values ("a73","https://www.carvana.com/vehicle/2169335",3,5,9,4,3,1,1,7,1,2,2,1);
insert into autoFactTable values ("a74","https://www.carvana.com/vehicle/2169335",2,2,4,2,4,2,2,8,1,2,2,2);
insert into autoFactTable values ("a75","https://www.carvana.com/vehicle/2169335",2,3,11,2,1,2,1,11,1,2,2,2);
insert into autoFactTable values ("a76","https://www.carvana.com/vehicle/2169335",2,4,9,3,1,2,3,6,2,2,1,2);
insert into autoFactTable values ("a77","https://www.carvana.com/vehicle/2169335",2,7,8,1,2,1,5,1,2,2,2,3);
insert into autoFactTable values ("a78","https://www.carvana.com/vehicle/2169335",2,5,5,2,1,2,1,12,2,1,2,3);
insert into autoFactTable values ("a79","https://www.carvana.com/vehicle/2169335",3,2,11,3,1,2,2,3,1,2,2,1);
insert into autoFactTable values ("a80","https://www.carvana.com/vehicle/2169335",3,3,12,4,4,2,3,11,2,1,1,3);
insert into autoFactTable values ("a81","https://www.carvana.com/vehicle/2169335",3,1,2,3,1,1,1,6,1,1,2,3);
insert into autoFactTable values ("a82","https://www.carvana.com/vehicle/2169335",2,1,11,3,3,1,2,13,1,1,1,3);
insert into autoFactTable values ("a83","https://www.carvana.com/vehicle/2169335",2,3,2,3,2,2,4,11,1,2,2,1);
insert into autoFactTable values ("a84","https://www.carvana.com/vehicle/2169335",1,5,10,3,3,2,1,11,1,2,1,1);
insert into autoFactTable values ("a85","https://www.carvana.com/vehicle/2169335",1,5,6,2,2,2,2,2,2,1,2,3);
insert into autoFactTable values ("a86","https://www.carvana.com/vehicle/2169335",3,1,4,4,2,2,3,5,2,1,1,1);
insert into autoFactTable values ("a87","https://www.carvana.com/vehicle/2169335",3,1,9,1,1,1,4,3,2,1,2,1);
insert into autoFactTable values ("a88","https://www.carvana.com/vehicle/2169335",2,1,8,2,3,1,3,3,1,2,2,3);
insert into autoFactTable values ("a89","https://www.carvana.com/vehicle/2169335",3,6,3,3,2,2,1,2,2,1,1,3);
insert into autoFactTable values ("a90","https://www.carvana.com/vehicle/2169335",1,1,8,1,4,1,3,3,2,2,1,2);
insert into autoFactTable values ("a91","https://www.carvana.com/vehicle/2169335",2,7,1,3,3,1,3,15,1,1,1,3);
insert into autoFactTable values ("a92","https://www.carvana.com/vehicle/2169335",2,1,3,1,1,2,2,10,1,1,2,2);
insert into autoFactTable values ("a93","https://www.carvana.com/vehicle/2169335",1,3,4,2,1,2,2,5,1,1,2,3);
insert into autoFactTable values ("a94","https://www.carvana.com/vehicle/2169335",3,6,11,3,4,2,3,12,1,2,2,3);
insert into autoFactTable values ("a95","https://www.carvana.com/vehicle/2169335",1,2,12,3,1,1,1,9,2,2,1,2);
insert into autoFactTable values ("a96","https://www.carvana.com/vehicle/2169335",1,1,4,3,4,1,2,8,2,2,1,3);
insert into autoFactTable values ("a97","https://www.carvana.com/vehicle/2169335",2,4,1,2,1,2,1,1,1,1,1,3);
insert into autoFactTable values ("a98","https://www.carvana.com/vehicle/2169335",1,5,6,2,3,1,3,5,1,2,2,3);
insert into autoFactTable values ("a99","https://www.carvana.com/vehicle/2169335",3,5,5,2,3,1,1,10,1,2,1,3);
insert into autoFactTable values ("a100","https://www.carvana.com/vehicle/2169335",2,7,7,3,3,2,4,3,2,2,1,2);
insert into autoFactTable values ("a101","https://www.carvana.com/vehicle/2169335",1,3,10,4,2,1,3,14,2,2,2,1);
insert into autoFactTable values ("a102","https://www.carvana.com/vehicle/2169335",3,8,4,3,3,1,3,13,1,2,2,2);
insert into autoFactTable values ("a103","https://www.carvana.com/vehicle/2169335",2,1,12,4,3,2,5,5,2,1,1,3);
insert into autoFactTable values ("a104","https://www.carvana.com/vehicle/2169335",3,8,10,2,2,1,4,16,1,2,2,2);
insert into autoFactTable values ("a105","https://www.carvana.com/vehicle/2169335",2,2,9,4,1,1,3,3,1,2,2,2);
insert into autoFactTable values ("a106","https://www.carvana.com/vehicle/2169335",1,5,8,1,1,2,1,13,1,2,1,3);
insert into autoFactTable values ("a107","https://www.carvana.com/vehicle/2169335",3,6,7,1,2,1,2,7,2,2,1,1);
insert into autoFactTable values ("a108","https://www.carvana.com/vehicle/2169335",3,4,5,3,2,2,2,9,1,2,1,3);
insert into autoFactTable values ("a109","https://www.carvana.com/vehicle/2169335",1,4,7,1,2,1,5,3,1,2,1,3);
insert into autoFactTable values ("a110","https://www.carvana.com/vehicle/2169335",3,2,10,3,1,2,3,8,1,2,2,3);
insert into autoFactTable values ("a111","https://www.carvana.com/vehicle/2169335",1,5,3,3,2,2,1,9,1,2,2,1);
insert into autoFactTable values ("a112","https://www.carvana.com/vehicle/2169335",2,8,10,2,2,2,5,8,2,2,2,3);
insert into autoFactTable values ("a113","https://www.carvana.com/vehicle/2169335",2,5,12,1,3,1,3,14,2,1,2,3);
insert into autoFactTable values ("a114","https://www.carvana.com/vehicle/2169335",1,8,8,1,2,1,4,8,1,1,1,2);
insert into autoFactTable values ("a115","https://www.carvana.com/vehicle/2169335",1,3,1,2,2,2,3,7,2,1,1,3);
insert into autoFactTable values ("a116","https://www.carvana.com/vehicle/2169335",2,3,10,3,1,1,4,11,1,2,1,2);
insert into autoFactTable values ("a117","https://www.carvana.com/vehicle/2169335",1,7,1,2,1,2,5,14,1,1,1,1);
insert into autoFactTable values ("a118","https://www.carvana.com/vehicle/2169335",3,7,6,4,1,1,5,2,1,2,1,3);
insert into autoFactTable values ("a119","https://www.carvana.com/vehicle/2169335",3,5,1,2,3,1,3,8,1,2,2,3);
insert into autoFactTable values ("a120","https://www.carvana.com/vehicle/2169335",2,2,11,1,3,1,1,11,2,1,1,3);
insert into autoFactTable values ("a121","https://www.carvana.com/vehicle/2169335",2,7,6,3,3,1,5,4,2,2,2,3);
insert into autoFactTable values ("a122","https://www.carvana.com/vehicle/2169335",2,8,7,1,3,1,5,8,1,1,1,1);
insert into autoFactTable values ("a123","https://www.carvana.com/vehicle/2169335",2,8,2,1,2,1,5,8,1,2,2,2);
insert into autoFactTable values ("a124","https://www.carvana.com/vehicle/2169335",2,4,5,4,2,1,4,9,2,2,1,3);
insert into autoFactTable values ("a125","https://www.carvana.com/vehicle/2169335",2,4,10,2,2,2,4,9,2,1,2,1);
insert into autoFactTable values ("a126","https://www.carvana.com/vehicle/2169335",3,4,9,4,4,1,2,15,2,1,2,2);
insert into autoFactTable values ("a127","https://www.carvana.com/vehicle/2169335",1,2,3,2,4,2,4,5,2,1,2,3);
insert into autoFactTable values ("a128","https://www.carvana.com/vehicle/2169335",1,8,8,4,1,1,1,13,1,2,1,3);
insert into autoFactTable values ("a129","https://www.carvana.com/vehicle/2169335",1,3,10,2,2,2,3,6,2,2,2,3);
insert into autoFactTable values ("a130","https://www.carvana.com/vehicle/2169335",3,1,11,3,2,2,4,15,2,2,1,2);
insert into autoFactTable values ("a131","https://www.carvana.com/vehicle/2169335",3,8,1,4,2,1,3,3,1,2,1,3);
insert into autoFactTable values ("a132","https://www.carvana.com/vehicle/2169335",3,1,12,3,2,2,2,2,1,2,1,3);
insert into autoFactTable values ("a133","https://www.carvana.com/vehicle/2169335",2,7,11,3,4,2,3,5,2,1,2,2);
insert into autoFactTable values ("a134","https://www.carvana.com/vehicle/2169335",3,1,12,3,3,2,2,12,1,2,2,1);
insert into autoFactTable values ("a135","https://www.carvana.com/vehicle/2169335",1,3,3,2,4,1,1,8,2,2,1,2);
insert into autoFactTable values ("a136","https://www.carvana.com/vehicle/2169335",2,6,2,3,4,2,3,9,1,1,2,1);
insert into autoFactTable values ("a137","https://www.carvana.com/vehicle/2169335",3,2,12,4,2,2,5,16,1,1,2,3);
insert into autoFactTable values ("a138","https://www.carvana.com/vehicle/2169335",2,5,2,1,1,2,4,7,2,1,2,3);
insert into autoFactTable values ("a139","https://www.carvana.com/vehicle/2169335",3,4,12,4,2,1,4,5,2,1,2,2);
insert into autoFactTable values ("a140","https://www.carvana.com/vehicle/2169335",1,6,1,2,3,2,3,1,1,2,2,2);
insert into autoFactTable values ("a141","https://www.carvana.com/vehicle/2169335",1,3,9,4,2,1,1,11,1,1,2,3);
insert into autoFactTable values ("a142","https://www.carvana.com/vehicle/2169335",2,4,1,3,2,2,5,5,2,2,2,2);
insert into autoFactTable values ("a143","https://www.carvana.com/vehicle/2169335",1,7,10,2,3,1,4,16,1,1,1,2);
insert into autoFactTable values ("a144","https://www.carvana.com/vehicle/2169335",2,2,3,1,2,2,3,1,1,1,1,2);
insert into autoFactTable values ("a145","https://www.carvana.com/vehicle/2169335",2,8,5,1,4,2,5,9,2,1,2,3);
insert into autoFactTable values ("a146","https://www.carvana.com/vehicle/2169335",1,2,12,4,1,2,4,3,1,2,2,1);
insert into autoFactTable values ("a147","https://www.carvana.com/vehicle/2169335",3,6,5,4,1,1,1,13,2,2,1,3);
insert into autoFactTable values ("a148","https://www.carvana.com/vehicle/2169335",3,6,7,2,1,1,1,2,2,1,2,2);
insert into autoFactTable values ("a149","https://www.carvana.com/vehicle/2169335",2,2,11,3,1,1,1,11,2,1,2,3);
insert into autoFactTable values ("a150","https://www.carvana.com/vehicle/2169335",2,8,5,4,2,1,5,9,2,1,2,2);
insert into autoFactTable values ("a151","https://www.carvana.com/vehicle/2169335",3,8,3,3,1,1,5,1,1,1,1,2);
insert into autoFactTable values ("a152","https://www.carvana.com/vehicle/2169335",1,5,9,2,4,1,5,11,1,2,2,2);
insert into autoFactTable values ("a153","https://www.carvana.com/vehicle/2169335",1,6,9,2,4,2,1,13,1,2,2,1);
insert into autoFactTable values ("a154","https://www.carvana.com/vehicle/2169335",1,3,1,4,1,2,3,5,2,2,1,3);
insert into autoFactTable values ("a155","https://www.carvana.com/vehicle/2169335",3,5,7,1,2,1,1,2,1,2,1,3);
insert into autoFactTable values ("a156","https://www.carvana.com/vehicle/2169335",2,4,1,1,4,1,5,9,1,2,1,1);
insert into autoFactTable values ("a157","https://www.carvana.com/vehicle/2169335",3,1,2,1,3,2,1,6,2,1,2,1);
insert into autoFactTable values ("a158","https://www.carvana.com/vehicle/2169335",3,8,3,2,2,1,2,6,2,1,2,3);
insert into autoFactTable values ("a159","https://www.carvana.com/vehicle/2169335",1,4,11,2,2,1,3,11,2,1,2,2);
insert into autoFactTable values ("a160","https://www.carvana.com/vehicle/2169335",2,6,12,3,4,2,4,16,1,2,1,3);
insert into autoFactTable values ("a161","https://www.carvana.com/vehicle/2169335",1,1,8,1,2,2,4,10,1,1,1,3);
insert into autoFactTable values ("a162","https://www.carvana.com/vehicle/2169335",2,6,11,1,2,1,2,9,1,1,2,3);
insert into autoFactTable values ("a163","https://www.carvana.com/vehicle/2169335",1,5,2,1,4,2,5,9,1,1,1,2);
insert into autoFactTable values ("a164","https://www.carvana.com/vehicle/2169335",3,8,1,3,2,2,5,9,2,1,2,3);
insert into autoFactTable values ("a165","https://www.carvana.com/vehicle/2169335",2,5,8,1,1,2,2,9,1,2,2,2);
insert into autoFactTable values ("a166","https://www.carvana.com/vehicle/2169335",1,4,12,3,1,2,2,1,1,1,1,1);
insert into autoFactTable values ("a167","https://www.carvana.com/vehicle/2169335",2,7,8,2,4,2,1,15,2,1,2,2);
insert into autoFactTable values ("a168","https://www.carvana.com/vehicle/2169335",3,7,7,2,1,2,3,6,2,2,1,2);
insert into autoFactTable values ("a169","https://www.carvana.com/vehicle/2169335",2,2,11,4,1,2,4,5,2,2,2,2);
insert into autoFactTable values ("a170","https://www.carvana.com/vehicle/2169335",3,8,8,4,2,2,4,9,2,2,2,2);
insert into autoFactTable values ("a171","https://www.carvana.com/vehicle/2169335",1,3,2,1,4,2,4,8,1,1,1,3);
insert into autoFactTable values ("a172","https://www.carvana.com/vehicle/2169335",1,8,5,3,4,1,2,7,1,1,1,3);
insert into autoFactTable values ("a173","https://www.carvana.com/vehicle/2169335",1,6,1,3,4,1,3,5,1,2,1,2);
insert into autoFactTable values ("a174","https://www.carvana.com/vehicle/2169335",2,1,4,4,4,2,4,9,1,2,2,1);
insert into autoFactTable values ("a175","https://www.carvana.com/vehicle/2169335",3,7,11,2,2,1,3,9,2,2,2,2);
insert into autoFactTable values ("a176","https://www.carvana.com/vehicle/2169335",2,2,4,2,1,2,2,13,1,2,2,2);
insert into autoFactTable values ("a177","https://www.carvana.com/vehicle/2169335",2,7,12,3,1,1,5,7,1,2,1,2);
insert into autoFactTable values ("a178","https://www.carvana.com/vehicle/2169335",2,6,3,2,2,2,4,3,1,1,1,2);
insert into autoFactTable values ("a179","https://www.carvana.com/vehicle/2169335",1,3,6,1,2,1,1,7,2,1,1,1);
insert into autoFactTable values ("a180","https://www.carvana.com/vehicle/2169335",2,3,5,1,2,2,5,11,1,1,1,3);
insert into autoFactTable values ("a181","https://www.carvana.com/vehicle/2169335",1,4,10,1,3,2,1,15,2,2,1,1);
insert into autoFactTable values ("a182","https://www.carvana.com/vehicle/2169335",1,4,6,1,3,2,2,16,2,2,1,2);
insert into autoFactTable values ("a183","https://www.carvana.com/vehicle/2169335",1,8,4,4,2,2,5,6,1,2,1,3);
insert into autoFactTable values ("a184","https://www.carvana.com/vehicle/2169335",2,4,7,4,3,1,4,9,2,1,2,2);
insert into autoFactTable values ("a185","https://www.carvana.com/vehicle/2169335",2,8,11,1,3,2,5,14,2,1,1,2);
insert into autoFactTable values ("a186","https://www.carvana.com/vehicle/2169335",3,2,11,3,3,1,3,12,2,1,1,2);
insert into autoFactTable values ("a187","https://www.carvana.com/vehicle/2169335",2,4,7,3,1,1,1,16,1,1,1,2);
insert into autoFactTable values ("a188","https://www.carvana.com/vehicle/2169335",2,2,12,3,3,1,1,1,1,1,1,2);
insert into autoFactTable values ("a189","https://www.carvana.com/vehicle/2169335",1,5,9,4,4,1,3,3,2,2,1,3);
insert into autoFactTable values ("a190","https://www.carvana.com/vehicle/2169335",1,7,5,2,2,2,3,16,2,2,1,3);
insert into autoFactTable values ("a191","https://www.carvana.com/vehicle/2169335",1,3,1,3,1,1,4,13,1,2,1,1);
insert into autoFactTable values ("a192","https://www.carvana.com/vehicle/2169335",1,2,10,2,3,1,3,11,2,1,1,1);
insert into autoFactTable values ("a193","https://www.carvana.com/vehicle/2169335",2,6,6,2,3,1,3,14,2,1,1,2);
insert into autoFactTable values ("a194","https://www.carvana.com/vehicle/2169335",2,1,5,2,3,1,5,10,2,1,2,3);
insert into autoFactTable values ("a195","https://www.carvana.com/vehicle/2169335",1,8,7,1,3,1,4,5,2,2,1,2);
insert into autoFactTable values ("a196","https://www.carvana.com/vehicle/2169335",2,5,1,2,2,2,1,10,1,1,2,2);
insert into autoFactTable values ("a197","https://www.carvana.com/vehicle/2169335",3,3,10,4,3,2,4,9,2,1,2,3);
insert into autoFactTable values ("a198","https://www.carvana.com/vehicle/2169335",2,4,1,2,4,2,2,15,1,1,2,2);
insert into autoFactTable values ("a199","https://www.carvana.com/vehicle/2169335",2,5,4,1,2,1,3,13,1,2,2,2);
insert into autoFactTable values ("a200","https://www.carvana.com/vehicle/2169335",3,3,11,3,3,1,1,7,2,1,2,2);
insert into autoFactTable values ("a201","https://www.carvana.com/vehicle/2169335",1,8,3,1,3,1,3,10,1,1,2,2);
insert into autoFactTable values ("a202","https://www.carvana.com/vehicle/2169335",3,5,9,4,2,1,3,1,2,1,2,2);
insert into autoFactTable values ("a203","https://www.carvana.com/vehicle/2169335",3,8,3,4,1,2,4,2,1,1,1,1);
insert into autoFactTable values ("a204","https://www.carvana.com/vehicle/2169335",2,6,3,1,1,2,3,3,1,1,2,1);
insert into autoFactTable values ("a205","https://www.carvana.com/vehicle/2169335",3,3,5,1,3,2,4,6,1,1,2,3);
insert into autoFactTable values ("a206","https://www.carvana.com/vehicle/2169335",3,2,3,4,3,2,2,10,2,2,1,1);
insert into autoFactTable values ("a207","https://www.carvana.com/vehicle/2169335",2,5,9,1,1,1,4,1,2,1,2,3);
insert into autoFactTable values ("a208","https://www.carvana.com/vehicle/2169335",1,8,3,2,3,2,1,16,2,2,1,2);
insert into autoFactTable values ("a209","https://www.carvana.com/vehicle/2169335",1,7,9,4,2,1,3,12,1,1,2,2);
insert into autoFactTable values ("a210","https://www.carvana.com/vehicle/2169335",2,6,2,1,1,1,2,6,1,1,2,1);
insert into autoFactTable values ("a211","https://www.carvana.com/vehicle/2169335",2,5,9,1,3,2,5,3,2,2,1,2);
insert into autoFactTable values ("a212","https://www.carvana.com/vehicle/2169335",1,3,1,4,2,2,3,9,1,2,1,1);
insert into autoFactTable values ("a213","https://www.carvana.com/vehicle/2169335",3,1,11,4,1,2,4,10,2,1,1,2);
insert into autoFactTable values ("a214","https://www.carvana.com/vehicle/2169335",3,1,1,3,4,1,4,6,1,2,1,2);
insert into autoFactTable values ("a215","https://www.carvana.com/vehicle/2169335",1,3,8,3,1,1,3,5,1,1,1,1);
insert into autoFactTable values ("a216","https://www.carvana.com/vehicle/2169335",1,4,12,4,2,2,5,12,2,2,2,1);
insert into autoFactTable values ("a217","https://www.carvana.com/vehicle/2169335",1,3,10,2,4,2,1,5,2,1,1,3);
insert into autoFactTable values ("a218","https://www.carvana.com/vehicle/2169335",3,7,5,4,4,2,2,2,1,1,1,3);
insert into autoFactTable values ("a219","https://www.carvana.com/vehicle/2169335",3,7,7,2,3,1,2,7,2,2,2,3);
insert into autoFactTable values ("a220","https://www.carvana.com/vehicle/2169335",2,5,8,4,4,2,1,9,2,1,1,3);
insert into autoFactTable values ("a221","https://www.carvana.com/vehicle/2169335",1,3,2,2,3,1,2,9,1,2,2,2);
insert into autoFactTable values ("a222","https://www.carvana.com/vehicle/2169335",1,5,2,3,3,2,5,7,2,2,2,3);
insert into autoFactTable values ("a223","https://www.carvana.com/vehicle/2169335",2,1,10,1,1,1,4,4,1,1,2,2);
insert into autoFactTable values ("a224","https://www.carvana.com/vehicle/2169335",2,8,8,1,2,1,2,1,1,1,1,3);
insert into autoFactTable values ("a225","https://www.carvana.com/vehicle/2169335",3,3,9,3,2,1,4,15,2,2,2,3);
insert into autoFactTable values ("a226","https://www.carvana.com/vehicle/2169335",1,2,9,1,4,2,4,14,1,2,2,1);
insert into autoFactTable values ("a227","https://www.carvana.com/vehicle/2169335",1,5,3,1,3,2,2,13,2,2,1,1);
insert into autoFactTable values ("a228","https://www.carvana.com/vehicle/2169335",1,2,1,4,4,2,4,16,1,1,2,1);
insert into autoFactTable values ("a229","https://www.carvana.com/vehicle/2169335",1,4,1,4,2,1,4,11,1,1,1,1);
insert into autoFactTable values ("a230","https://www.carvana.com/vehicle/2169335",1,2,2,2,2,2,4,5,2,2,1,2);
insert into autoFactTable values ("a231","https://www.carvana.com/vehicle/2169335",2,3,9,2,2,1,3,15,1,2,2,2);
insert into autoFactTable values ("a232","https://www.carvana.com/vehicle/2169335",1,5,1,4,4,2,5,11,1,1,1,1);
insert into autoFactTable values ("a233","https://www.carvana.com/vehicle/2169335",3,2,5,4,2,1,4,14,2,2,2,3);
insert into autoFactTable values ("a234","https://www.carvana.com/vehicle/2169335",1,7,9,2,1,1,3,2,2,2,2,3);
insert into autoFactTable values ("a235","https://www.carvana.com/vehicle/2169335",1,3,12,3,1,1,3,3,2,1,1,3);
insert into autoFactTable values ("a236","https://www.carvana.com/vehicle/2169335",2,5,9,4,4,1,5,7,1,1,1,1);
insert into autoFactTable values ("a237","https://www.carvana.com/vehicle/2169335",2,5,10,1,3,2,3,11,1,1,2,1);
insert into autoFactTable values ("a238","https://www.carvana.com/vehicle/2169335",1,6,5,1,4,1,4,5,1,1,1,2);
insert into autoFactTable values ("a239","https://www.carvana.com/vehicle/2169335",2,8,2,2,3,2,5,15,1,1,2,3);
insert into autoFactTable values ("a240","https://www.carvana.com/vehicle/2169335",2,6,6,4,3,1,2,7,1,1,2,3);
insert into autoFactTable values ("a241","https://www.carvana.com/vehicle/2169335",2,2,2,4,1,2,5,4,2,2,1,2);
insert into autoFactTable values ("a242","https://www.carvana.com/vehicle/2169335",2,3,3,1,3,2,3,9,2,1,2,1);
insert into autoFactTable values ("a243","https://www.carvana.com/vehicle/2169335",1,6,10,1,3,1,3,2,2,2,1,3);
insert into autoFactTable values ("a244","https://www.carvana.com/vehicle/2169335",2,5,1,1,2,1,1,6,1,1,1,1);
insert into autoFactTable values ("a245","https://www.carvana.com/vehicle/2169335",2,2,9,2,1,1,3,7,1,1,1,1);
insert into autoFactTable values ("a246","https://www.carvana.com/vehicle/2169335",1,3,10,3,2,2,3,15,1,1,1,1);
insert into autoFactTable values ("a247","https://www.carvana.com/vehicle/2169335",1,6,12,4,4,2,2,12,2,1,1,1);
insert into autoFactTable values ("a248","https://www.carvana.com/vehicle/2169335",2,3,10,2,3,2,1,3,1,1,1,2);
insert into autoFactTable values ("a249","https://www.carvana.com/vehicle/2169335",1,5,12,4,3,1,4,15,2,2,2,2);

