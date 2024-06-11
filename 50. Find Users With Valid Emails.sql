SELECT * FROM Users 
WHERE regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode\\.com$') 

-- ^[A-Za-z] = first char must be a letter

--+[A-Za-z0-9\_\.\-]* next characters can be letters, numbers, and '_ . -'

--@leetcode\\.com$ must have a @, must have a ., must end after .com