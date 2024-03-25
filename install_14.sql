-- ----------------------------------------- --
-- Insert all automatically generated SQL here --
-- ----------------------------------------- --

-- ----------------------------------------- --
-- Custom configuration and account creation --
-- ----------------------------------------- --
   
-- Create new user --
INSERT INTO 
  redcap_user_information(username, user_email, user_firstname, user_lastname, super_user, user_creation, account_manager) 
       VALUES ('admin', 'your_email@mail.com', 'John', 'Doe', 1, NOW(), 0);
INSERT INTO 
  redcap_auth(username, password, password_salt, legacy_hash, temp_pwd, password_question, password_answer, password_question_reminder, password_reset_key) 
       VALUES ('admin', MD5(CONCAT('password', 'rdczjf123')), 'rdczjf123', 1, 0, NULL, NULL, NULL, NULL);

-- Grant full admin roles, disable for default user --
UPDATE redcap_user_information SET
                                  access_system_config=1,
                                  access_system_upgrade=1,
                                  access_external_module_install=1,
                                  admin_rights=1,
                                  access_admin_dashboards=1
                                WHERE username='admin';
UPDATE redcap_user_information SET super_user = 0 WHERE username = 'site_admin';

-- Change authorization to table-based and enable --                                
UPDATE redcap_config SET value = 'table' WHERE field_name = 'auth_meth_global';

-- Add 's' to http to force domain to load secure --
-- UPDATE redcap_config set value = 'https://redcap.localhost' where field_name='redcap_base_url'; --
