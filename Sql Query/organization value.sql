INSERT INTO organization (
  company_name,
  created_by_user,
  company_url,
  address,
  contact_no,
  about_org,
  created_at
) VALUES (
  'FutureTech Pvt Ltd',
  (SELECT user_id FROM user_details WHERE email_id = 'kumar99sanchit@gmail.com'),
  'https://www.futuretech.in',
  '201 Cyber Park, Hyderabad, India',
  '+91-9045971070',
  'FutureTech is revolutionizing online assessments through AI-powered evaluation and adaptive testing.',
  NOW()
);
