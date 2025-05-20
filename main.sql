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
   
create table SampleList (
	SampleListID int,
    SampleID int,
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
        SampleID int,
        EquipmentID int,
        UserID int,
        PretreatmentDate datetime,
        primary key (PretreatmentID),
        foreign key (SampleID) references Sample(SampleID),
        foreign key (EquipmentID) references Equipment(EquipmentID),
        foreign key (UserID) references User(UserID));
	
create table Extraction (
	ExtractionID int,
    SampleID int,
    MaterialPreparationID int,
    EquipmentID int,
    UserID int,
    Concentration decimal (6,2),
    Purity decimal (3,2),
    ExtractionDate datetime,
    primary key (ExtractionID),
    foreign key (SampleID) references Sample(SampleID),
    foreign key (MaterialPreparationID) references MaterialPreparation(MaterialPreparationID),
    foreign key (EquipmentID) references Equipment(EquipmentID),
	foreign key (UserID) references User(UserID));      
    
create table TestingForm (
	TestingFormID int,
    UserID int,
    SampleListID int,
    MethodID int,
    ExtractionID int,
    PretreatmentID int, 
    TestingDate datetime,
    primary key (TestingFormID),
    foreign key (UserID) references User(UserID),
    foreign key (SampleListID) references samplelist(SampleListID),
    foreign key (MethodID) references Method(MethodID),
    foreign key (ExtractionID) references Extraction(ExtractionID),
    foreign key (PretreatmentID) references Pretreatment(PretreatmentID));
    


    

    

    
/*
    
create table Result (
	ResultID int,
    TestingFormID int,
    Material_preparation_ID int,
    AnalysisID int,
    UserID int,
    primary key (ResultID),
    foreign key (TestingFormID) references TestingForm(TestingFormID),
    foreign key (Material_preparation_ID) references Material_preparation(Material_preparation_ID),
    foreign key (AnalysisID) references Analysis(AnalysisID),
    foreign key(UserID) references User(UserID));    
    
create table Report (
	ReportID int,
    ResultID int,
    ReferenceFile varchar(256),
    UserID int,
    ReportDate datetime,
    primary key (ReportID),
    foreign key (ResultID) reference Result(ResultID),
    foreign key (UserID) reference User(UserID));
    
create table Report_valid (
	Report_valid_ID int,
    ReportID int,
    UserID_managerID int,
    Signing_date datetime,
    primary key (Report_valid_ID),
    foreign key (ReportID) reference Report(ReportID),
    foreign key (UserID) reference User(UserID));
    */
    
    
    