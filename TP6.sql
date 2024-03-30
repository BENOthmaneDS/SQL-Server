--Partie 1-- 
--Question 1--
--BD CNOPS est générer--

--Question 2--
--SELECT * FROM dbo.Patient
--SELECT * FROM dbo.CONSULTE
--SELECT * FROM dbo.CHAMBRE
--SELECT PATIENT.PMUTUELLE FROM CNOPS.dbo.PATIENT WHERE PNUMERO=14
SELECT count(*) FROM dbo.Patient, dbo.Consulte, dbo.MEDECIN WHERE PATIENT.PNUMERO=CONSULTE.PNUMERO and MEDECIN.MNUMERO=CONSULTE.MNUMERO and PATIENT.PNUMERO=13


Create Function consultationPrice(@PatientID int)
returns int
As
Begin
	declare @typeMedecin text
	declare @dateConsultation datetime
	declare @typeMutuelle varchar(50)
	declare @price int
	

	SELECT @typeMedecin = MQUALITE FROM dbo.Patient, dbo.Consulte, dbo.MEDECIN WHERE PATIENT.PNUMERO=CONSULTE.PNUMERO and MEDECIN.MNUMERO=CONSULTE.MNUMERO and PATIENT.PNUMERO=@PatientID
	--Test de type medecin
	if(@typeMutuelle = 'specialiste')
		BEGIN
			SET @price = 250
		END
	else if(@typeMutuelle = 'generaliste')
		BEGIN
			SET @price = 120
		END
	--Test des horaires si different de 20h <--> 8h
	SELECT @dateConsultation = DATE_CONSULTATION FROM dbo.Patient, dbo.Consulte, dbo.MEDECIN WHERE PATIENT.PNUMERO=CONSULTE.PNUMERO and MEDECIN.MNUMERO=CONSULTE.MNUMERO and PATIENT.PNUMERO=@PatientID
	if(@dateConsultation = 'specialiste')
		BEGIN
			SET @price = 250
		END


	SELECT @typeMutuelle = PMUTUELLE FROM dbo.PATIENT WHERE PATIENT.PNUMERO=@PatientID 
	if(@typeMutuelle = 'CNOPS')
		BEGIN
			SET @price = 
		END
	if (@typeMutuelle = 'CNSS')

	
	return @price 
End