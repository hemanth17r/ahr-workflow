---
name: send-outreach-email
description: >-
  Dispatches cold outreach, founder applications, and follow-up emails directly via configured Gmail SMTP credentials. Trigger whenever the user says "send email", "send this email", "dispatch email", "send outreach", "mail the founder", or "send it via smtp".
---

# Send Outreach Email (Direct SMTP Integration)

Direct automated email dispatching skill using Hemanth's authenticated Gmail SMTP configuration.

---

## 🔑 SMTP Configuration & Credentials

The SMTP credentials are permanently stored in the project root `.env`:
- **File**: `C:\Users\AKKALA HEMANTH REDDY\Documents\antigravity\happy-curie\.env`
- **Sender Address**: `hemanth17r@gmail.com`
- **Sender Name**: `Hemanth Reddy`
- **Host**: `smtp.gmail.com`
- **Port**: `465` (SSL)
- **App Password Variable**: `GMAIL_APP_PASSWORD`

---

## ⚡ Execution Protocol

When triggered to send an email:

1. **Verify Recipient, Subject, and Body**:
   - Ensure the message content matches Hemanth's grounded style (under 80 words, zero fluff, verified live products).
   - Ensure `To`, `Cc` (if applicable), and `Subject` are clearly defined.

2. **Execute Dispatch Command**:
   Run the following inline Python command directly via `run_command`:

```pwsh
python -c "
import os
import smtplib
from email.mime.text import MIMEText
from email.header import Header

# Load credentials from .env
env_path = r'C:\Users\AKKALA HEMANTH REDDY\Documents\antigravity\happy-curie\.env'
with open(env_path, 'r') as f:
    for line in f:
        if line.strip() and '=' in line and not line.startswith('#'):
            k, v = line.strip().split('=', 1)
            os.environ[k] = v

sender = os.environ.get('GMAIL_USER')
password = os.environ.get('GMAIL_APP_PASSWORD')

recipient = 'TARGET_EMAIL_HERE'
cc = 'OPTIONAL_CC_HERE' # or empty string ''
recipients = [recipient] + ([cc] if cc else [])

subject = 'SUBJECT_HERE'
body = '''BODY_HERE'''

msg = MIMEText(body, 'plain', 'utf-8')
msg['Subject'] = Header(subject, 'utf-8')
msg['From'] = f'Hemanth Reddy <{sender}>'
msg['To'] = recipient
if cc:
    msg['Cc'] = cc

with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
    server.login(sender, password)
    server.sendmail(sender, recipients, msg.as_string())

print('SUCCESS_EMAIL_DISPATCHED')
"
```

3. **Verification**:
   - Confirm output logs `SUCCESS_EMAIL_DISPATCHED`.
   - Report sent status to the user with the recipient, subject, and time of dispatch.
