-- HMS Sample Data
-- Safe to re-run: uses ON CONFLICT DO NOTHING

-- ── PATIENTS ────────────────────────────────────────────────
INSERT INTO patients (name, age, gender, blood_group, address, phone, email, emergency_contact, disease_history) VALUES
('Sarah Mitchell',    34, 'Female', 'O+',  '142 Oak Street, Springfield',         '555-0101', 'sarah.mitchell@email.com',  'Tom Mitchell: 555-0102',    'Hypertension'),
('James Thornton',   58, 'Male',   'A+',  '89 Maple Ave, Riverside',             '555-0103', 'james.thornton@email.com',  'Linda Thornton: 555-0104', 'Type 2 Diabetes, High Cholesterol'),
('Priya Patel',      27, 'Female', 'B+',  '305 Elm Drive, Lakewood',             '555-0105', 'priya.patel@email.com',     'Raj Patel: 555-0106',       'Asthma'),
('Marcus Johnson',   45, 'Male',   'AB+', '77 Pine Road, Hillside',              '555-0107', 'marcus.j@email.com',        'Diane Johnson: 555-0108',  'None'),
('Emily Chen',       31, 'Female', 'O-',  '223 Cedar Lane, Westview',            '555-0109', 'emily.chen@email.com',      'David Chen: 555-0110',     'Seasonal Allergies'),
('Robert Garcia',    62, 'Male',   'A-',  '418 Birch Blvd, Northgate',           '555-0111', 'r.garcia@email.com',        'Maria Garcia: 555-0112',   'COPD, Hypertension'),
('Aisha Williams',   23, 'Female', 'B-',  '56 Willow Way, Southpark',            '555-0113', 'aisha.w@email.com',         'James Williams: 555-0114', 'None'),
('Thomas Brown',     50, 'Male',   'O+',  '891 Ash Court, Eastside',             '555-0115', 'thomas.brown@email.com',    'Susan Brown: 555-0116',    'Arthritis, Post-hip surgery'),
('Fatima Al-Hassan', 38, 'Female', 'AB-', '12 Rose Garden, Midtown',             '555-0117', 'fatima.h@email.com',        'Khalid Hassan: 555-0118',  'Migraines'),
('Daniel Park',      41, 'Male',   'B+',  '670 Sunset Blvd, Westend',            '555-0119', 'daniel.park@email.com',     'Jenny Park: 555-0120',     'Hypothyroidism'),
('Linda Okafor',     55, 'Female', 'O+',  '3 Harbour View, Coastline',           '555-0121', 'linda.okafor@email.com',    'Emeka Okafor: 555-0122',   'Breast Cancer (remission)'),
('Ryan Kowalski',    29, 'Male',   'A+',  '88 Central Ave, Downtown',            '555-0123', 'ryan.k@email.com',          'Anna Kowalski: 555-0124',  'None'),
('Grace Nakamura',   47, 'Female', 'O-',  '231 Sakura Street, Garden District',  '555-0125', 'grace.n@email.com',         'Kenji Nakamura: 555-0126', 'Type 2 Diabetes'),
('Carlos Rivera',    33, 'Male',   'B+',  '19 Plaza Norte, Eastside',            '555-0127', 'c.rivera@email.com',        'Ana Rivera: 555-0128',     'None'),
('Helen Foster',     70, 'Female', 'A+',  '5 Oak Manor Drive, Uptown',           '555-0129', 'helen.f@email.com',         'Peter Foster: 555-0130',   'Heart Disease, Hypertension')
ON CONFLICT DO NOTHING;

-- ── DOCTORS ─────────────────────────────────────────────────
INSERT INTO doctors (name, specialization, qualification, experience, phone, email, availability) VALUES
('Dr. Catherine Walsh',   'Cardiology',       'MD, FACC',    18, '555-0201', 'c.walsh@hospital.com',    'Mon-Fri 9am-5pm'),
('Dr. Samuel Okafor',     'General Medicine', 'MBBS, MD',    12, '555-0202', 's.okafor@hospital.com',   'Mon-Sat 8am-4pm'),
('Dr. Linda Nakamura',    'Neurology',        'MD, PhD',     22, '555-0203', 'l.nakamura@hospital.com', 'Tue-Thu 10am-6pm'),
('Dr. Ahmed Hassan',      'Orthopedics',      'MS, FRCS',    15, '555-0204', 'a.hassan@hospital.com',   'Mon-Fri 8am-3pm'),
('Dr. Rachel Kim',        'Pediatrics',       'MD, FAAP',     9, '555-0205', 'r.kim@hospital.com',      'Mon-Fri 9am-5pm'),
('Dr. Michael Torres',    'Oncology',         'MD, FASCO',   20, '555-0206', 'm.torres@hospital.com',   'Wed-Fri 10am-4pm'),
('Dr. Priya Sharma',      'Endocrinology',    'MD, DM',      14, '555-0207', 'p.sharma@hospital.com',   'Mon-Wed 9am-5pm'),
('Dr. James Whitfield',   'Pulmonology',      'MD, FCCP',    17, '555-0208', 'j.whitfield@hospital.com','Tue-Sat 8am-4pm')
ON CONFLICT DO NOTHING;

-- ── APPOINTMENTS ────────────────────────────────────────────
INSERT INTO appointments (patient_id, doctor_id, date, time, status, notes) VALUES
-- Today
(1,  1, CURRENT_DATE::text,        '09:00', 'scheduled', 'Regular cardiac checkup – BP monitoring'),
(2,  7, CURRENT_DATE::text,        '10:30', 'scheduled', 'HbA1c review and insulin adjustment'),
(13, 7, CURRENT_DATE::text,        '11:30', 'scheduled', 'Thyroid & blood sugar management'),
(3,  8, CURRENT_DATE::text,        '14:00', 'scheduled', 'Asthma follow-up, spirometry planned'),
(15, 1, CURRENT_DATE::text,        '15:30', 'scheduled', 'Post-cardiac event follow-up'),
-- Yesterday
(4,  4, (CURRENT_DATE-1)::text,    '09:00', 'completed', 'Knee pain – X-ray ordered'),
(5,  2, (CURRENT_DATE-1)::text,    '10:00', 'completed', 'Annual physical examination'),
(9,  3, (CURRENT_DATE-1)::text,    '11:00', 'completed', 'Migraine – MRI results reviewed'),
(10, 7, (CURRENT_DATE-1)::text,    '14:00', 'completed', 'Hypothyroidism – levothyroxine dose review'),
-- 2 days ago
(6,  1, (CURRENT_DATE-2)::text,    '09:30', 'completed', 'ECG and lung function test'),
(11, 6, (CURRENT_DATE-2)::text,    '11:00', 'completed', 'Oncology follow-up – remission check'),
(7,  3, (CURRENT_DATE-2)::text,    '14:30', 'cancelled',  'Headache – patient cancelled'),
-- 3 days ago
(8,  4, (CURRENT_DATE-3)::text,    '10:00', 'completed', 'Post-hip surgery check-up'),
(12, 2, (CURRENT_DATE-3)::text,    '11:30', 'completed', 'General check-up – healthy'),
(14, 5, (CURRENT_DATE-3)::text,    '15:00', 'completed', 'Sports injury – shoulder strain'),
-- Upcoming
(1,  2, (CURRENT_DATE+1)::text,    '09:00', 'scheduled', 'Lab results review'),
(2,  6, (CURRENT_DATE+1)::text,    '11:00', 'scheduled', 'Oncology consultation'),
(5,  3, (CURRENT_DATE+2)::text,    '10:00', 'scheduled', 'Neurology follow-up'),
(3,  1, (CURRENT_DATE+2)::text,    '14:30', 'scheduled', 'Chest X-ray review'),
(6,  8, (CURRENT_DATE+3)::text,    '09:30', 'scheduled', 'Pulmonary rehab review'),
(13, 2, (CURRENT_DATE+3)::text,    '11:00', 'scheduled', 'General diabetes management'),
(15, 4, (CURRENT_DATE+4)::text,    '10:30', 'scheduled', 'Joint pain assessment')
ON CONFLICT DO NOTHING;

-- ── MEDICAL RECORDS ─────────────────────────────────────────
INSERT INTO medical_records (patient_id, doctor_id, diagnosis, prescription, treatment, notes) VALUES
(1,  1, 'Essential Hypertension Stage 1',
    'Lisinopril 10mg once daily, Amlodipine 5mg once daily',
    'Low-sodium diet, aerobic exercise 30 min/day',
    'BP 145/92 at last visit. Good medication compliance. Follow up in 4 weeks.'),
(2,  7, 'Type 2 Diabetes Mellitus with Dyslipidaemia',
    'Metformin 850mg twice daily, Atorvastatin 40mg nightly, Glipizide 5mg with meals',
    'Dietary counseling, blood glucose monitoring twice daily',
    'HbA1c 7.8%. Target below 7.0%. Lipids improving.'),
(3,  8, 'Moderate Persistent Asthma',
    'Salbutamol inhaler 2 puffs PRN, Fluticasone 250mcg inhaler twice daily',
    'Breathing exercises, allergen avoidance, peak flow diary',
    'Peak flow 78% predicted. Last exacerbation 3 months ago.'),
(4,  4, 'Right Knee Osteoarthritis – Grade II',
    'Ibuprofen 400mg TDS with food, Pantoprazole 20mg daily (GI protection)',
    'Physiotherapy 2x/week, weight reduction advised',
    'X-ray shows moderate joint space narrowing medially. BMI 29.'),
(5,  2, 'Seasonal Allergic Rhinitis',
    'Cetirizine 10mg once daily PRN, Fluticasone nasal spray 2 puffs/nostril daily',
    'Nasal irrigation, allergen avoidance plan',
    'Worst in spring and autumn. Symptoms controlled.'),
(6,  1, 'Hypertensive Heart Disease + COPD',
    'Lisinopril 10mg, Aspirin 75mg, Tiotropium inhaler once daily',
    'Pulmonary rehab program, smoking cessation',
    'Echo shows mild LV hypertrophy. EF 55%. FEV1 62% predicted.'),
(7,  3, 'Tension-Type Headache',
    'Paracetamol 500mg QDS PRN, Amitriptyline 10mg at night (prophylaxis)',
    'Stress management, sleep hygiene, hydration',
    'Headaches 3-4x/week. Neurological exam normal. MRI pending.'),
(8,  4, 'Post-op: Right Hip Replacement',
    'Warfarin 5mg daily (target INR 2-3), Paracetamol 500mg QDS',
    'Daily physiotherapy, DVT prevention, weight bearing as tolerated',
    'Wound healing well. INR 2.4 – therapeutic. Walking with frame.'),
(9,  3, 'Chronic Migraine with Aura',
    'Sumatriptan 50mg at onset, Topiramate 50mg twice daily (prevention)',
    'Migraine diary, trigger avoidance, regular sleep schedule',
    'MRI brain normal. 12 headache days/month. Topiramate started.'),
(10, 7, 'Hypothyroidism',
    'Levothyroxine 75mcg once daily (fasting)',
    'Take 30 min before breakfast. Recheck TSH in 6 weeks.',
    'TSH 6.2 mIU/L. Slightly elevated. Dose increased from 50mcg.'),
(11, 6, 'Breast Cancer – Stage II (Remission)',
    'Tamoxifen 20mg once daily (5-year course, year 3)',
    'Quarterly oncology reviews, annual mammography',
    'No evidence of recurrence. CA-125 and CEA within normal limits.'),
(13, 7, 'Type 2 Diabetes Mellitus',
    'Metformin 500mg twice daily, Gliclazide 40mg with breakfast',
    'Carbohydrate counting, exercise 4x/week',
    'HbA1c 8.1%. Diet poorly controlled. Diabetes educator referral made.'),
(15, 1, 'Coronary Artery Disease – Post MI',
    'Aspirin 75mg, Clopidogrel 75mg, Atorvastatin 80mg, Bisoprolol 5mg, Ramipril 5mg',
    'Cardiac rehab program, Mediterranean diet',
    'MI 6 months ago. EF 50%. Stress test normal. Doing well.')
ON CONFLICT DO NOTHING;

-- ── BILLS ────────────────────────────────────────────────────
INSERT INTO bills (patient_id, consultation_fee, lab_charges, medicine_charges, amount, payment_status, payment_date, description, created_at) VALUES
(1,  150.00, 85.00,  45.00, 280.00,  'paid',    '2026-05-15', 'Cardiology consultation + ECG',              NOW() - INTERVAL '22 days'),
(2,  120.00, 210.00, 38.50, 368.50,  'paid',    '2026-05-20', 'Diabetes + HbA1c + lipid panel',             NOW() - INTERVAL '17 days'),
(3,  100.00, 75.00,  22.00, 197.00,  'paid',    '2026-04-10', 'Asthma follow-up + spirometry',              NOW() - INTERVAL '57 days'),
(4,  200.00, 150.00, 52.00, 402.00,  'paid',    '2026-04-22', 'Orthopedic consultation + X-ray right knee', NOW() - INTERVAL '45 days'),
(5,  100.00, 45.00,  12.00, 157.00,  'paid',    '2026-03-18', 'Annual physical + allergy screen',           NOW() - INTERVAL '80 days'),
(6,  150.00, 320.00, 75.50, 545.50,  'paid',    '2026-03-05', 'Cardiology + Echo + spirometry',             NOW() - INTERVAL '93 days'),
(7,  100.00, 0,      0,     100.00,  'pending', NULL,         'Neurology consultation',                     NOW() - INTERVAL '1 days'),
(8,  200.00, 180.00, 55.00, 435.00,  'paid',    '2026-05-28', 'Post-op hip review + INR + physio',          NOW() - INTERVAL '9 days'),
(9,  150.00, 220.00, 30.00, 400.00,  'paid',    '2026-05-10', 'Neurology + MRI brain',                      NOW() - INTERVAL '27 days'),
(10, 120.00, 65.00,  18.50, 203.50,  'paid',    '2026-05-22', 'Endocrinology + thyroid function tests',     NOW() - INTERVAL '15 days'),
(11, 200.00, 150.00, 22.00, 372.00,  'paid',    '2026-04-30', 'Oncology review + tumour markers',           NOW() - INTERVAL '37 days'),
(12, 100.00, 0,      0,     100.00,  'paid',    '2026-06-04', 'General consultation',                       NOW() - INTERVAL '3 days'),
(13, 120.00, 90.00,  28.00, 238.00,  'paid',    '2026-05-25', 'Diabetes management + HbA1c',                NOW() - INTERVAL '12 days'),
(14, 100.00, 55.00,  15.00, 170.00,  'paid',    '2026-06-04', 'Sports injury + shoulder X-ray',             NOW() - INTERVAL '3 days'),
(15, 200.00, 280.00, 95.00, 575.00,  'paid',    '2026-05-01', 'Cardiology + stress ECG + echo',             NOW() - INTERVAL '36 days'),
(1,  100.00, 0,      15.75, 115.75,  'pending', NULL,         'Medication refill',                          NOW()),
(3,  100.00, 75.00,  18.50, 193.50,  'pending', NULL,         'Asthma review + spirometry',                 NOW()),
(6,  100.00, 0,      46.25, 146.25,  'paid',    '2026-01-30', 'Hypertension medication review',             NOW() - INTERVAL '127 days'),
(2,  150.00, 95.00,  22.00, 267.00,  'paid',    '2026-02-14', 'Diabetes quarterly review',                  NOW() - INTERVAL '112 days'),
(15, 150.00, 0,      95.00, 245.00,  'pending', NULL,         'Cardiac medication refill',                  NOW() - INTERVAL '1 days')
ON CONFLICT DO NOTHING;

-- ── MEDICINES ────────────────────────────────────────────────
INSERT INTO medicines (name, quantity, expiry_date, price, manufacturer, category) VALUES
('Amoxicillin 500mg',       250,  '2026-09-30', 12.99,  'PharmaCo',        'Antibiotic'),
('Metformin 850mg',           6,  '2026-06-30',  8.50,  'GenMed',          'Antidiabetic'),
('Lisinopril 10mg',         180,  '2026-12-31', 15.75,  'CardioPharm',     'Antihypertensive'),
('Atorvastatin 40mg',         4,  '2025-12-31', 22.00,  'LipidCare',       'Statin'),
('Salbutamol Inhaler',       45,  '2026-08-31', 18.50,  'BreathEasy',      'Bronchodilator'),
('Ibuprofen 400mg',         500,  '2027-01-31',  6.25,  'PainRelief Inc',  'NSAID'),
('Omeprazole 20mg',         300,  '2026-11-30',  9.99,  'GastroCare',      'PPI'),
('Paracetamol 500mg',       750,  '2027-06-30',  4.50,  'BasicMed',        'Analgesic'),
('Warfarin 5mg',              5,  '2026-03-31', 35.00,  'BloodCare',       'Anticoagulant'),
('Levothyroxine 75mcg',     120,  '2026-10-31', 11.25,  'ThyroMed',        'Thyroid Hormone'),
('Amlodipine 5mg',          200,  '2027-02-28', 13.50,  'CardioPharm',     'Antihypertensive'),
('Tamoxifen 20mg',           60,  '2026-07-31', 48.00,  'OncoMed',         'Anticancer'),
('Sumatriptan 50mg',         90,  '2026-09-30', 28.75,  'NeuroCare',       'Antimigraine'),
('Fluticasone Inhaler',      35,  '2026-08-31', 32.00,  'BreathEasy',      'Corticosteroid'),
('Ciprofloxacin 500mg',      90,  '2026-08-31', 16.75,  'PharmaCo',        'Antibiotic'),
('Aspirin 75mg',            400,  '2027-03-31',  5.99,  'BasicMed',        'Antiplatelet'),
('Bisoprolol 5mg',            8,  '2026-05-31', 19.50,  'CardioPharm',     'Beta Blocker'),
('Topiramate 50mg',          80,  '2027-01-31', 24.00,  'NeuroCare',       'Anticonvulsant'),
('Cetirizine 10mg',         350,  '2027-04-30',  7.25,  'AllergyMed',      'Antihistamine'),
('Clopidogrel 75mg',         30,  '2026-09-30', 31.00,  'CardioPharm',     'Antiplatelet')
ON CONFLICT DO NOTHING;

-- ── LAB REPORTS ──────────────────────────────────────────────
INSERT INTO lab_reports (patient_id, test_name, result, status, report_date) VALUES
(1,  'ECG (12-lead)',              'Sinus rhythm. LVH pattern. No acute ST changes.',                                   'completed', (CURRENT_DATE-22)::text),
(1,  'Lipid Panel',               'Total Chol: 198, LDL: 120, HDL: 52, TG: 130. All within target.',                   'completed', (CURRENT_DATE-22)::text),
(2,  'HbA1c',                     '7.8% (target <7.0%)',                                                                'completed', (CURRENT_DATE-17)::text),
(2,  'Fasting Glucose',           '9.2 mmol/L (high)',                                                                  'completed', (CURRENT_DATE-17)::text),
(2,  'Lipid Panel',               'Total Chol: 245, LDL: 168, HDL: 42, TG: 175. LDL elevated.',                        'completed', (CURRENT_DATE-17)::text),
(3,  'Spirometry',                'FEV1: 72% predicted, FEV1/FVC: 0.74. Mild obstruction.',                             'completed', (CURRENT_DATE-57)::text),
(3,  'Peak Flow Measurement',     'PEF: 320 L/min (78% predicted)',                                                     'completed', (CURRENT_DATE-57)::text),
(4,  'X-Ray Right Knee',          'Grade II OA. Moderate joint space narrowing medially. No acute fracture.',            'completed', (CURRENT_DATE-45)::text),
(5,  'Full Blood Count',          'WBC: 6.8, RBC: 4.6, Hgb: 13.9, Plt: 260. All normal.',                              'completed', (CURRENT_DATE-80)::text),
(6,  'Echocardiogram',            'Mild LV hypertrophy. EF: 55%. No wall motion abnormalities.',                        'completed', (CURRENT_DATE-93)::text),
(6,  'Spirometry',                'FEV1/FVC: 0.62 (moderate obstructive pattern). FEV1: 58% predicted.',                'completed', (CURRENT_DATE-93)::text),
(8,  'PT/INR',                    'INR: 2.4 (therapeutic range 2.0-3.0)',                                               'completed', (CURRENT_DATE-9)::text),
(9,  'MRI Brain',                 'No space-occupying lesion. No acute infarct. Mild periventricular changes.',          'completed', (CURRENT_DATE-27)::text),
(10, 'Thyroid Function (TSH/T4)', 'TSH: 6.2 mIU/L (high). Free T4: 12.1 pmol/L (low normal). Consistent with hypothyroidism.', 'completed', (CURRENT_DATE-15)::text),
(11, 'CA-125 Tumour Marker',      '18 U/mL (normal <35 U/mL). No evidence of recurrence.',                              'completed', (CURRENT_DATE-37)::text),
(11, 'CEA',                       '2.1 ng/mL (normal <5 ng/mL).',                                                      'completed', (CURRENT_DATE-37)::text),
(13, 'HbA1c',                     '8.1% (poorly controlled)',                                                           'completed', (CURRENT_DATE-12)::text),
(15, 'Stress ECG',                'No ischaemic changes at target HR. Functional capacity good.',                        'completed', (CURRENT_DATE-36)::text),
(15, 'Echocardiogram',            'EF: 50%. Mild inferior wall hypokinesia. No significant valvular disease.',           'completed', (CURRENT_DATE-36)::text),
-- Pending
(1,  'Renal Function Panel',      'Pending processing',                                                                 'pending',   CURRENT_DATE::text),
(7,  'MRI Brain',                 'Pending processing',                                                                 'pending',   CURRENT_DATE::text),
(3,  'IgE Allergy Panel',         'Pending processing',                                                                 'pending',   (CURRENT_DATE+1)::text),
(14, 'X-Ray Right Shoulder',      'Pending processing',                                                                 'pending',   CURRENT_DATE::text)
ON CONFLICT DO NOTHING;
