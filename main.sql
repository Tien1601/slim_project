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
    primary key (SampleDeliveryID),
    foreign key (SampleID) references Sample(SampleID),
    foreign key (EquipmentID) references Equipment(EquipmentID));
    
create table Warehouse (
	WarehouseID int,
    WarehouseName varchar(128),
    EquipmentID int,
    Location varchar(64),
    `Description` varchar(1024),
    primary key (WarehouseID),
    foreign key (EquipmentID) references Equipment(EquipmentID));
    
create table Warehouse_checklist (
	Warehouse_checklist_ID int,
    WarehouseID int,
    SampleID int,
    UserID int,
    EquipmentID int,
    `Status` varchar(64),
    Inventory decimal(6,2),
    UseDate datetime,
    primary key (Warehouse_checklist_ID),
    foreign key (WarehouseID) reference Warehouse(WarehouseID),
    foreign key (SampleID) reference Sample(SampleID),
    foreign key (UserID) reference `User`(UserID),
    foreign key (EquipmentID) reference Equipment(EquipmentID));
    
create table Material (
	MaterialID int,
    MaterialName varchar(64),
    Code varchar(32),
    primary key (MaterialID));
    
create table Material_preparation (
	Material_preparation_ID int,
    MaterialID int,
    InternalID int,
    UserID int,
    EquipmentID int,
    PreparationDate datetime,
    ExpirationDate datetime,
    primary key (Material_preparation_ID),
    foreign key (MaterialID) references Material(MaterialID),
    foreign key (UserID) references User(UserID),
    foreign key (Equipment) references Equipment(EquipmentID));
    
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
    
    
    