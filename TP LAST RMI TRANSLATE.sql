--SELECT * FROM dbo.dictionnaire

create procedure translate @mot nvarchar(50), @ls nvarchar(50), @ld nvarchar(50) 
	WITH RECOMPILE
	AS
	
	if(@ls = 'ar')	
		begin
		if(@ld = 'ar')
			begin
				return @mot
			end

		else if(@ld = 'fr')
			begin
				SELECT fr FROM dbo.dictionnaire WHERE ar = @mot
			end
		else if(@ld = 'en')
			begin
				SELECT en FROM dbo.dictionnaire WHERE ar = @mot
			end
		else if(@ld = 'de')
			begin
				SELECT de FROM dbo.dictionnaire WHERE ar = @mot
			end
		end


		else if(@ls = 'en')	
		begin
		if(@ld = 'en')
			begin
				return @mot
			end

		else if(@ld = 'fr')
			begin
				SELECT fr FROM dbo.dictionnaire WHERE en = @mot
			end
		else if(@ld = 'ar')
			begin
				SELECT ar FROM dbo.dictionnaire WHERE en = @mot
			end
		else if(@ld = 'de')
			begin
				SELECT de FROM dbo.dictionnaire WHERE en = @mot
			end
		end

		else if(@ls = 'fr')	
		begin
		if(@ld = 'fr')
			begin
				return @mot
			end

		else if(@ld = 'en')
			begin
				SELECT en FROM dbo.dictionnaire WHERE fr = @mot
			end
		else if(@ld = 'ar')
			begin
				SELECT ar FROM dbo.dictionnaire WHERE fr = @mot
			end
		else if(@ld = 'de')
			begin
				SELECT de FROM dbo.dictionnaire WHERE fr = @mot
			end
		end


		else if(@ls = 'de')	
		begin
		if(@ld = 'de')
			begin
				return @mot
			end

		else if(@ld = 'en')
			begin
				SELECT en FROM dbo.dictionnaire WHERE de = @mot
			end
		else if(@ld = 'ar')
			begin
				SELECT ar FROM dbo.dictionnaire WHERE de = @mot
			end
		else if(@ld = 'fr')
			begin
				SELECT fr FROM dbo.dictionnaire WHERE de = @mot
			end
		end


exec translate 'voiture','fr','en'
execute translate 'wagon','de','en'

