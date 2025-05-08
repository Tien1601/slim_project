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
    
    