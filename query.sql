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

-- thông tin chi tiết chuẩn bị nguyên vật liệu

select material.MaterialName, material.Code, materialpreparation.InternalID, materialpreparation.UserID, materialpreparation.PreparationDate, materialpreparation.ExpirationDate
from (materialpreparation
inner join material on materialpreparation.MaterialID = material.MaterialID);

-- khi 2 chữ số cuối của internalID là 01 thì ngày hết hạn thêm 3 tháng, 02 thêm 6 tháng
