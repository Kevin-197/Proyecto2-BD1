9.936664978432468, -84.10387736116917

9.938109382691358, -84.10530705776522 está

9.855237151554086, -83.60193405756199
DECLARE @punto1 geography;
DECLARE @punto2 geography;
SET @punto1 = geography::Point(9.938170343080436, -84.10527301683693, 4326)
SET @punto2 = geography::Point(9.938170343080436, -84.10527301683693, 4326)
select @punto1, @punto2, GEOGRAPHY::STGeomFromText('POINT(-84.10284076470533 9.93634085217945)', 4326)
        .STBuffer(1000).STIntersects(@punto2) as [Intersects]



Drop procedure if exists sp_Search
Create procedure sp_Search
	(@pLatitude decimal(18,14),
	@pLongitude decimal(18,14)
	)
	as
	begin
	Select hab.Title as Habito, loc.Location.ToString() as Coordenadas from Habits hab inner join
	LocationsxHabit lxh on lxh.HabitId = hab.HabitId inner join
	Locations loc on loc.LocationId = lxh.LocationId 
	where GEOGRAPHY::STGeomFromText('POINT('+convert(nvarchar(20), @pLongitude)+' '+convert( nvarchar(20), @pLatitude)+')', 4326)
	.STBuffer(1000)
	.STIntersects(loc.Location) =1
END
EXEC sp_Search 9.937521900373886, -84.10009086378808









Select hab.Title from Habits hab inner join
LocationsxHabit lxh on lxh.HabitId = hab.HabitId inner join
Locations loc on loc.LocationId = lxh.LocationId 
where GEOGRAPHY::STGeomFromText('POINT('+-84.10284076470533+' '+9.93634085217945+')', 4326).STBuffer(1000).STIntersects(@punto2) =1