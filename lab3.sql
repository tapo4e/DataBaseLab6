CREATE TABLE job_title
(
  pk_job_title varchar(128) NOT NULL,
  salary integer NOT NULL,
  employee_rate integer NOT NULL,
  PRIMARY KEY(pk_job_title)
);

INSERT INTO job_title
VALUES
('Cardiologist', 120000, 80),
('Orthopedic Surgeon', 150000, 100),
('Pediatrician', 100000, 70),
('Anesthesiologist', 130000, 90),
('Neurologist', 140000, 95),
('Dermatologist', 110000, 75),
('Oncologist', 160000, 110),
('Gynecologist', 120000, 80),
('Urologist', 130000, 90),
('Psychiatrist', 110000, 75),
('Radiologist', 140000, 95),
('Emergency Medicine Physician', 130000, 90),
('General Practitioner', 100000, 70),
('Surgeon', 150000, 100),
('Ophthalmologist', 120000, 80),
('ENT Specialist', 110000, 75),
('Orthodontist', 140000, 95),
('Pathologist', 130000, 90),
('Infectious Disease Specialist', 120000, 80),
('Endocrinologist', 140000, 95),
('Rheumatologist', 130000, 90),
('Pulmonologist', 130000, 90),
('Gastroenterologist', 140000, 95),
('Nephrologist', 130000, 90),
('Hematologist', 140000, 95),
('Family Medicine Physician', 100000, 70),
('Dental Surgeon', 120000, 80),
('Maxillofacial Surgeon', 150000, 100),
('Podiatrist', 110000, 75),
('Allergist', 120000, 80);

CREATE TABLE doctor 
(
	pk_phone_number varchar(128) NOT NULL ,
	full_name varchar(128) NOT NULL ,
	experience varchar(128) NOT NULL ,
	CONSTRAINT doctor_pkey PRIMARY KEY(pk_phone_number)
);

INSERT INTO doctor 
VALUES
('+375291233567', 'Smirnova Ekaterina Aleksandrovna', '4 years'),
('+375449876533', 'Ivanov Aleksey Vladimirovich', '2 years'),
('+375251122334', 'Petrova Mariya Igorevna', '6 years'),
('+375335556777', 'Kozlova Alena Alekseevna', '3 years'),
('+37525566778', 'Mikhaylov Ivan Nikolaevich', '1 year'),
('+375298899000', 'Sergeev Artem Valentinovich', '5 years'),
('+375259876543', 'Fedorova Yelizaveta Andreevna', '3 years'),
('+375333333333', 'Alexandrov Igor Vladimirovich', '2 years'),
('+375444444444', 'Orlova Viktoriya Sergeevna', '4 years'),
('+375255555555', 'Novikov Dmitriy Petrovich', '1 year'),
('+375298765432', 'Morozova Olga Aleksandrovna', '5 years'),
('+375256789012', 'Timofeev Andrey Sergeevich', '3 years'),
('+375337890123', 'Kuznetsova Anastasiya Igorevna', '2 years'),
('+375448901234', 'Trofimov Yuriy Valentinovich', '6 years'),
('+375258765432', 'Grigoryeva Anna Mikhaylovna', '4 years'),
('+375299012345', 'Dmitriev Stanislav Sergeevich', '1 year'),
('+375251234567', 'Kharitonova Tatyana Aleksandrovna', '5 years'),
('+375331234567', 'Alekseev Aleksandr Petrovich', '3 years'),
('+375441234567', 'Belova Yevgeniya Sergeevna', '2 years'),
('+375252345678', 'Yakovlev Maksim Ivanovich', '4 years'),
('+375291234511', 'Gerasimova Ekaterina Vladimirovna', '2 years'),
('+375441234511', 'Ignatev Ivan Stepanovich', '5 years'),
('+375291234512', 'Zakharova Sofia Pavlovna', '1 year'),
('+375331234511', 'Karpov Kirill Sergeevich', '4 years'),
('+375441234512', 'Kiseleva Alena Igorevna', '3 years'),
('+375252345511', 'Krylov Artem Dmitrievich', '6 years');

CREATE TABLE personal_file 
(
	pk_phone_number varchar(128) NOT NULL REFERENCES doctor(pk_phone_number),
	pk_job_title varchar(128) NOT NULL REFERENCES job_title(pk_job_title),
	pk_id integer,
	CONSTRAINT personal_file_fkey PRIMARY KEY(pk_phone_number,pk_job_title,pk_id)
	
);

INSERT INTO personal_file
VALUES
('+375291234567', 'Cardiologist'),
('+375449876543', 'Orthopedic Surgeon'),
('+375251122334', 'Pediatrician'),
('+375335556677', 'Anesthesiologist'),
('+37525566778', 'Neurologist'),
('+375298899000', 'Dermatologist'),
('+375259876543', 'Oncologist'),
('+375333333333', 'Gynecologist'),
('+375444444444', 'Urologist'),
('+375255555555', 'Psychiatrist'),
('+375298765432', 'Radiologist'),
('+375256789012', 'Emergency Medicine Physician'),
('+375337890123', 'General Practitioner'),
('+375448901234', 'Surgeon'),
('+375258765432', 'Ophthalmologist'),
('+375299012345', 'ENT Specialist'),
('+375251234567', 'Orthodontist'),
('+375331234567', 'Pathologist'),
('+375441234567', 'Infectious Disease Specialist'),
('+375252345678', 'Endocrinologist'),
('+375291234511', 'Rheumatologist'),
('+375441234511', 'Pulmonologist'),
('+375291234512', 'Gastroenterologist'),
('+375331234511', 'Nephrologist'),
('+375441234512', 'Hematologist'),
('+375252345511', 'Family Medicine Physician'),
('+375251112233', 'Dental Surgeon'),
('+375291234567', 'Maxillofacial Surgeon'),
('+375335556677', 'Podiatrist'),
('+375449876543', 'Allergist');

CREATE TABLE hospital_ward 
(
	pk_id integer NOT NULL,
	number_of_beds integer NOT NULL ,
	equipment varchar(128) NOT NULL,
	CONSTRAINT hospital_ward_pkey PRIMARY KEY(pk_id)
	
);


INSERT INTO hospital_ward
VALUES
(DEFAULT, 4, 'beds, chairs, shower'),
(DEFAULT, 3, 'beds, chairs, shower'),
(DEFAULT, 5, 'beds, TV, shower, chairs'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 5, 'beds, TV, shower, chairs, fridge'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 5, 'beds, TV, shower, chairs, fridge'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower'),
(DEFAULT, 5, 'beds, TV, shower, chairs, fridge'),
(DEFAULT, 4, 'beds, chairs, shower, TV'),
(DEFAULT, 3, 'beds, chairs, shower, fridge'),
(DEFAULT, 2, 'beds, chairs, shower');

CREATE TABLE patient 
(
	pk_id integer NOT NULL,
	full_name varchar(128) NOT NULL,
	address varchar(128) NOT NULL ,
	phone_number varchar(128) NOT NULL,
	fk_hospital_ward_id integer NOT NULL REFERENCES hospital_ward(), 
	CONSTRAINT patient_pkey PRIMARY KEY(pk_id),
	CONSTRAINT patient_fkey FOREIGN KEY(fk_hospital_ward_id)
	
);

INSERT INTO patient
VALUES
(DEFAULT, 'Ivanov A.P.', 'Petrova 8', '+375447969932', 5),
(DEFAULT, 'Petrov K.V.', 'Sidorova 23', '+375447779933', 8),
(DEFAULT, 'Sidorova A.A.', 'Kozlova 12', '+375447969934', 7),
(DEFAULT, 'Kozlov K.N.', 'Gikalo 12', '+375447169935', 6),
(DEFAULT, 'Smirnova E.A.', 'Landesheva 14', '+375447969936', 9),
(DEFAULT, 'Ivanov A.V.', 'Gikalo 12', '+375447779937', 10),
(DEFAULT, 'Petrova M.I.', 'Kamenka 12', '+375447969938', 11),
(DEFAULT, 'Kozlova A.A.', 'Petrova 8', '+375447169939', 12),
(DEFAULT, 'Mikhaylov I.N.', 'Sidorova 23', '+375447969940', 13),
(DEFAULT, 'Sergeev A.V.', 'Kozlova 12', '+375447779941', 14),
(DEFAULT, 'Fedorova Y.A.', 'Gikalo 12', '+375447969942', 15),
(DEFAULT, 'Alexandrov I.V.', 'Landesheva 14', '+375447169943', 16),
(DEFAULT, 'Orlova V.S.', 'Gikalo 12', '+375447969944', 17),
(DEFAULT, 'Novikov D.P.', 'Kamenka 12', '+375447779945', 18),
(DEFAULT, 'Morozova O.A.', 'Petrova 8', '+375447969946', 19),
(DEFAULT, 'Timofeev A.S.', 'Sidorova 23', '+375447779947', 20),
(DEFAULT, 'Kuznetsova A.I.', 'Kozlova 12', '+375447969948', 21),
(DEFAULT, 'Trofimov Y.V.', 'Gikalo 12', '+375447779949', 22),
(DEFAULT, 'Grigoryeva A.M.', 'Landesheva 14', '+375447969950', 23),
(DEFAULT, 'Dmitriev S.S.', 'Gikalo 12', '+375447779951', 24),
(DEFAULT, 'Kharitonova T.A.', 'Kamenka 12', '+375447969952', 25),
(DEFAULT, 'Alekseev A.P.', 'Petrova 8', '+375447779953', 26),
(DEFAULT, 'Petrov I.V.', 'Sidorova 23', '+375447969954', 27),
(DEFAULT, 'Sidorov K.A.', 'Kozlova 12', '+375447779955', 28),
(DEFAULT, 'Kozlova O.N.', 'Gikalo 12', '+375447969956', 29),
(DEFAULT, 'Smirnov N.V.', 'Landesheva 14', '+375447779957', 30);

CREATE TABLE diagnosis
(
	pk_name varchar(128) NOT NULL PRIMARY KEY,
	treatment varchar(128) NOT NULL,
	medical_procedures varchar(128) NOT NULL
);


INSERT INTO diagnosis
VALUES
('Influenza', 'Antiviral medications, rest, and fluids', 'Symptomatic treatment, annual vaccination'),
('Allergies', 'Antihistamines and avoidance of allergens', 'Allergy testing, immunotherapy'),
('Gastroenteritis', 'Hydration and dietary changes', 'Antiemetics, electrolyte replacement'),
('Pneumonia', 'Antibiotics and supportive care', 'Chest X-ray, oxygen therapy'),
('Urinary Tract Infection (UTI)', 'Antibiotics and increased fluid intake', 'Urinalysis, culture'),
('Coronavirus (COVID-19)', 'Supportive care and antiviral medications', 'Isolation, respiratory support'),
('Heart Attack', 'Angioplasty, medication, and lifestyle changes', 'Cardiac catheterization, ECG'),
('Stroke', 'Clot-busting drugs and rehabilitation', 'MRI, CT scan, physical therapy'),
('Cataracts', 'Surgery to replace the cloudy lens', 'Eye exam, visual acuity test'),
('Glaucoma', 'Eye drops and surgery', 'Intraocular pressure measurement, visual field test'),
('Hearing Loss', 'Hearing aids and cochlear implants', 'Audiometry, otoscopy'),
('Dental Cavities', 'Fillings and fluoride treatment', 'Dental exam, X-rays'),
('Periodontal Disease', 'Scaling and root planing', 'Gum disease assessment, dental cleaning'),
('Arthritis', 'Pain relievers and anti-inflammatory medications', 'Joint aspiration, physical therapy'),
('Osteoporosis', 'Calcium and vitamin D supplements, medications', 'Bone density tests, fall prevention measures'),
('Fibromyalgia', 'Pain medications and physical therapy', 'Sleep improvement, stress management'),
('Chronic Fatigue Syndrome', 'Symptomatic treatment and lifestyle changes', 'Cognitive behavioral therapy, graded exercise therapy'),
('Irritable Bowel Syndrome (IBS)', 'Dietary changes and medications', 'Colonoscopy, symptom monitoring'),
('Migraine', 'Pain relievers and preventive medications', 'Lifestyle modifications, stress management'),
('Epilepsy', 'Antiepileptic drugs and lifestyle adjustments', 'Electroencephalogram (EEG), MRI'),
('Chronic Bronchitis', 'Bronchodilators and anti-inflammatory medications', 'Pulmonary function tests, oxygen therapy'),
('Atrial Fibrillation', 'Medications and procedures', 'Electrocardiogram (ECG), Holter monitor'),
('Rheumatoid Arthritis', 'Disease-modifying antirheumatic drugs (DMARDs)', 'Joint protection techniques, physical therapy'),
('Psoriasis', 'Topical treatments and medications', 'Phototherapy, systemic treatments'),
('Celiac Disease', 'Gluten-free diet and symptom management', 'Endoscopy, blood tests'),
('Eating Disorders', 'Psychotherapy and nutritional counseling', 'Medical monitoring, therapy sessions');

CREATE TABLE medicametns
(
	pk_name varchar(128) NOT NULL PRIMARY KEY,
	producer varchar(128) NOT NULL,
	amount_of integer NOT NULL
);

INSERT INTO medicaments 
VALUES 
('Aspirin', 'Bayer', 1000),
('Acetaminophen', 'Johnson & Johnson', 800),
('Ibuprofen', 'Pfizer', 1200),
('Amoxicillin', 'GlaxoSmithKline', 500),
('Lisinopril', 'AstraZeneca', 300),
('Metformin', 'Merck', 600),
('Simvastatin', 'Novartis', 400),
('Levothyroxine', 'AbbVie', 700),
('Albuterol', 'Boehringer Ingelheim', 200),
('Insulin', 'Sanofi', 150),
('Warfarin', 'Eli Lilly', 250),
('Omeprazole', 'Teva Pharmaceuticals', 300),
('Losartan', 'Roche', 350),
('Atorvastatin', 'Bristol Myers Squibb', 400),
('Gabapentin', 'Pfizer', 450),
('Amlodipine', 'Novartis', 500),
('Hydrochlorothiazide', 'AstraZeneca', 550),
('Metoprolol', 'Johnson & Johnson', 600),
('Diazepam', 'Teva Pharmaceuticals', 650),
('Prednisone', 'Pfizer', 700),
('Ciprofloxacin', 'Bayer', 750),
('Amitriptyline', 'AbbVie', 800),
('Clonazepam', 'Roche', 850),
('Cetirizine', 'Sanofi', 900),
('Escitalopram', 'Teva Pharmaceuticals', 950),
('Tamsulosin', 'Boehringer Ingelheim', 1000),
('Furosemide', 'Pfizer', 1050),
('Methotrexate', 'Eli Lilly', 1100),
('Dexamethasone', 'Novartis', 1150),
('Hydroxychloroquine', 'AbbVie', 1200),
('Ranitidine', 'Bayer', 1250);

CREATE TABLE recipe
(
	pk_id_recipe integer NOT NULL,
	name_medicament varchar(128) NOT NULL REFERNCES medicaments(pk_name),
	name_diagnosis varchar(128) NOT NULL REFERENCES diagnosis(pk_name),
	CONSTRAINT recipe_medicament_pkey PRIMARY KEY(pk_id_recipe,name_medicament,name_diagnosis)
);

INSERT INTO recipe 
VALUES
    (DEFAULT,'Acetaminophen', 'Allergies'),
    (DEFAULT,'Albuterol', 'Arthritis'),
    (DEFAULT,'Amitriptyline', 'Atrial Fibrillation'),
    (DEFAULT,'Amlodipine', 'Cataracts'),
    (DEFAULT,'Amoxicillin', 'Celiac Disease'),
    (DEFAULT,'Aspirin', 'Chronic Bronchitis'),
    (DEFAULT,'Atorvastatin', 'Chronic Fatigue Syndrome'),
    (DEFAULT,'Cetirizine', 'Common Cold'),
    (DEFAULT,'Ciprofloxacin', 'Coronavirus (COVID-19)'),
    (DEFAULT,'Clonazepam', 'Dental Cavities'),
    (DEFAULT,'Dexamethasone', 'Diabetes'),
    (DEFAULT,'Diazepam', 'Eating Disorders'),
    (DEFAULT,'Escitalopram', 'Epilepsy'),
    (DEFAULT,'Furosemide', 'Fibromyalgia'),
    (DEFAULT,'Gabapentin', 'Gastroenteritis'),
    (DEFAULT,'Hydrochlorothiazide', 'Glaucoma'),
    (DEFAULT,'Hydroxychloroquine', 'Hearing Loss'),
    (DEFAULT,'Ibuprofen', 'Heart Attack'),
    (DEFAULT,'Insulin', 'Hypertension'),
    (DEFAULT,'Levothyroxine', 'Influenza'),
    (DEFAULT,'Lisinopril', 'Irritable Bowel Syndrome (IBS)'),
    (DEFAULT,'Losartan', 'Migraine'),
    (DEFAULT,'Metformin', 'Osteoporosis'),
    (DEFAULT,'Methotrexate', 'Periodontal Disease'),
    (DEFAULT,'Metoprolol', 'Pneumonia'),
    (DEFAULT,'Omeprazole', 'Psoriasis'),
    (DEFAULT,'Prednisone', 'Rheumatoid Arthritis'),
    (DEFAULT,'Ranitidine', 'Sprained Ankle'),
    (DEFAULT,'Simvastatin', 'Stroke'),
    (DEFAULT,'Tamsulosin', 'Urinary Tract Infection (UTI)');
	
CREATE TABLE ticket
(
	pk_id SERIAL NOT NULL,
	pk_phone_number varchar(128) NOT NULL REFERENCES doctor(pk_phone_number),
	pk_id_patient integer NOT NULL REFERENCES patient(pk_id),
	pk_name_diagnosis varchar(128) NOT NULL REFERENCES diagnosis(pk_name),
	number_of_doctor_cabinet integer NOT NULL,
	date varchar(128) NOT NULL,
	CONSTRAINT ticket_pkey PRIMARY KEY(pk_id,pk_phone_number,pk_id_patient,pk_name_diagnosis)
);

INSERT INTO  ticket 
VALUES
 	(DEFAULT, '+375291234567',1, 'Urinary Tract Infection (UTI)', 456, '01.03.2024'),
    (DEFAULT, '+375335556677',2, 'Sprained Ankle', 225, '02.03.2024'),
    (DEFAULT, '+375449876543',3, 'Hypertension', 340, '03.03.2024'),
    (DEFAULT, '+37525566778', 4,'Common Cold', 189, '04.03.2024'),
    (DEFAULT, '+375298899000',5, 'Rheumatoid Arthritis', 293, '05.03.2024'),
    (DEFAULT, '+375259876543',6, 'Influenza', 421, '06.03.2024'),
    (DEFAULT, '+375333333333',7, 'Diabetes', 510, '07.03.2024'),
    (DEFAULT, '+375444444444',8, 'Chronic Fatigue Syndrome', 127, '08.03.2024'),
    (DEFAULT, '+375255555555',9, 'Psoriasis', 378, '09.03.2024'),
    (DEFAULT, '+375291233567',10, 'Arthritis', 511, '10.03.2024'),
    (DEFAULT, '+375291234511',11, 'Cataracts', 482, '11.03.2024'),
    (DEFAULT, '+375291234512',12, 'Epilepsy', 196, '12.03.2024'),
    (DEFAULT, '+375291234567',13, 'Heart Attack', 299, '13.03.2024'),
    (DEFAULT, '+375298765432', 14,'Osteoporosis', 399, '14.03.2024'),
    (DEFAULT, '+375298899000', 15,'Chronic Bronchitis', 148, '15.03.2024'),
    (DEFAULT, '+375299012345', 16,'Gastroenteritis', 278, '16.03.2024'),
    (DEFAULT, '+375331234511', 17,'Periodontal Disease', 433, '17.03.2024'),
    (DEFAULT, '+375331234567', 18,'Coronavirus (COVID-19)', 236, '18.03.2024'),
    (DEFAULT, '+375333333333', 19,'Celiac Disease', 356, '19.03.2024'),
    (DEFAULT, '+375335556677', 20,'Chronic Fatigue Syndrome', 489, '20.03.2024'),
    (DEFAULT, '+375335556777', 21,'Migraine', 312, '21.03.2024'),
    (DEFAULT, '+375337890123', 22,'Hypertension', 147, '22.03.2024'),
    (DEFAULT, '+375441234511', 23,'Irritable Bowel Syndrome (IBS)', 261, '23.03.2024'),
    (DEFAULT, '+375441234512', 24,'Stroke', 390, '24.03.2024'),
    (DEFAULT, '+375441234567', 25,'Chronic Fatigue Syndrome', 189, '25.03.2024'),
    (DEFAULT, '+375444444444', 26,'Hearing Loss', 492, '26.03.2024'),
    (DEFAULT, '+375448901234', 27,'Coronavirus (COVID-19)', 127, '27.03.2024'),
    (DEFAULT, '+375449876533', 28,'Heart Attack', 278, '28.03.2024'),
    (DEFAULT, '+375449876543', 29,'Common Cold', 394, '29.03.2024'),
    (DEFAULT, '+375449876543', 30,'Influenza', 245, '30.03.2024')




	
