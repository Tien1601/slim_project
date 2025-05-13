-- mẫu 1 ai là người chia, chia ngày nào, thuộc nhóm nào dùng thiết bị nào, ngày giờ nhận và ngày giờ chia
select sample.SampleID, sample.Name as SampleName, 
user.Name as Username, sample.Create_at as Receive_time, 
sampledelivery.Create_at as Delivery_time, `group`.Name as Groupname, equipment.Name as Equipmentname
from ((((sample
inner join user on sample.UserID = user.UserID)
inner join sampledelivery on sample.SampleID = sampledelivery.SampleID)
inner join `group` on `group`.GroupID = user.GroupID)
inner join equipment on equipment.EquipmentID = sampledelivery.EquipmentID);

-- method bao gom nhung mau nao va ten mau la gi?

select sample.Name, sampledelivery.SampleID, method.MethodName
from ((sampledelivery
inner join method on sampledelivery.MethodID = method.MethodID)
inner join sample on sampledelivery.SampleID = sample.SampleID);

-- group 1 lam
