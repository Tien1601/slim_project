use slim;
create table Equipment (
	EquipmentID int,
    Name varchar(64),
    Status varchar(64),
    primary key (EquipmentID));
    
create table `Group` (
	GroupID int,
    Name varchar(64),
    primary key (GroupID));

create table `User` (
	UserID int,
    Name varchar (64),
    Role varchar (64),
    GroupID int,
    Email varchar(64), 
    Phone int,
    Company varchar(64),
    primary key (UserID),
    foreign key (GroupID) references `Group`(GroupID));
    
create table Sample (
	SampleID int,
    Name varchar (64),
    Quantity decimal(6,2),
	Unit varchar(16),
    UserID int,
    Create_at datetime,
    primary key (SampleID),
    foreign key (UserID) references User(UserID));

alter table Sample modify column Create_at DATETIME DEFAULT CURRENT_TIMESTAMP; -- update data type of column Create_at from datetime to current_timetamp

create table CategoryMethod (
	CategoryMethodID int,
	Name varchar (64),
    primary key (CategoryMethodID));

create table Method (
	MethodID int,
    CategoryMethodID int,
    TargetName varchar (64),
    MethodName varchar (64),
    LOD decimal(6,2),
    LOQ decimal(6,2),
    Unit varchar (16),
    primary key (MethodID),
    foreign key (CategoryMethodID) references CategoryMethod(CategoryMethodID));
   


create table SampleDelivery (
	SampleDeliveryID int,
    SampleID int,
    EquipmentID int,
    UserID int,
    Create_at datetime,
    MethodID int,
    primary key (SampleDeliveryID),
    foreign key (SampleID) references Sample(SampleID),
    foreign key (EquipmentID) references Equipment(EquipmentID),
    foreign key (MethodID) references Method(MethodID));
  

create table SampleList (
	SampleListID int,
    SampleID int,
    Quantity decimal (6,2),
    Unit varchar(16),
    EquipmentID int,
    GroupID int,
    UserID int,
    Starttime datetime,
    primary key (SampleListID),
    foreign key (SampleID) references Sample(SampleID),
    foreign key (EquipmentID) references Equipment(EquipmentID),
    foreign key (GroupID) references `Group`(GroupID),
    foreign key (UserID) references User(UserID));
    
create table Material (
	MaterialID int,
    MaterialName varchar(64),
    Code varchar(32),
    primary key (MaterialID));
    
create table MaterialPreparation (
	MaterialPreparationID int,
    MaterialID int,
    InternalID int,
    UserID int,
    EquipmentID int,
    PreparationDate datetime,
    ExpirationDate datetime,
    primary key (MaterialPreparationID),
    foreign key (MaterialID) references Material(MaterialID),
    foreign key (UserID) references User(UserID),
    foreign key (EquipmentID) references Equipment(EquipmentID));
      
    
create table Pretreatment (
		PretreatmentID int,
        SampleListID int,
        EquipmentID int,
        UserID int,
        PretreatmentDate datetime,
        primary key (PretreatmentID),
        foreign key (EquipmentID) references Equipment(EquipmentID),
        foreign key (SampleListID) references SampleList(SampleListID),
        foreign key (UserID) references User(UserID));


create table Extraction (
	ExtractionID int,
    PretreatmentID int,
    MaterialPreparationID int,
    EquipmentID int,
    UserID int,
    Concentration decimal (6,2),
    Purity decimal (3,2),
    ExtractionDate datetime,
    primary key (ExtractionID),
    foreign key (PretreatmentID) references Pretreatment(PretreatmentID),
    foreign key (MaterialPreparationID) references MaterialPreparation(MaterialPreparationID),
    foreign key (EquipmentID) references Equipment(EquipmentID),
    foreign key (UserID) references User(UserID));

alter table method add ExtractionID int; -- Add the ExtractionID field to the Method table

alter table method add foreign key (ExtractionID) references Extraction(ExtractionID); -- Add foreign key ExtractionID to the Method table


create table Analysis (
	AnalysisID int,
	SampleID int,
	EquipmentID int,
	Result decimal (8,2),
	UserID int,
	create_at datetime,
	primary key (AnalysisID),
	foreign key (SampleID) references Sample(SampleID),
	foreign key (EquipmentID) references Equipment(EquipmentID),
	foreign key (UserID) references User(UserID));
	    
    
create table Report (
	ReportID int,
	SampleID int,
    AnalysisID int,
    ReferenceFile varchar(256),
    MaterialPreparationID int,
    MethodID int,
    PretreatmentID int,
    UserID int,
    ReportDate datetime,
    primary key (ReportID),
    foreign key (SampleID) references Sample(SampleID),
    foreign key (AnalysisID) references Analysis(AnalysisID),
	foreign key (MaterialPreparationID) references MaterialPreparation(MaterialPreparationID),
	foreign key (MethodID) references Method(MethodID),
	foreign key (PretreatmentID) references Pretreatment(PretreatmentID),
	foreign key (UserID) references User(UserID));
    
create table ReportValid (
	ReportValidID int,
    ReportID int,
    UserID int, -- manager User
    SigningDate datetime,
    primary key (ReportValidID),
    foreign key (ReportID) references Report(ReportID),
    foreign key (UserID) references User(UserID));

    
    
