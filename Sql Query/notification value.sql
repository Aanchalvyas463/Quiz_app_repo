INSERT INTO notification (
    user_id,
    message_content,
    is_delivered,
    is_read,
    created_at
)
VALUES (
    (SELECT user_id FROM user_details WHERE email_id = 'ankit123sharma@gmail.com'),
    'Great Job! Wanna try something new skill.',
    TRUE,
    TRUE,
    NOW()
);
