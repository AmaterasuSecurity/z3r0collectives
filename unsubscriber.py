"""
This scripts will search through gmail for any emails that contains a unsubscribe link
and output the direct unsub link for you to go to and unsub from.
"""

#!/opt/homebrew/bin/python3

import imapclient
import pyzmail
import webbrowser
import bs4
import getpass

# User input
user_email = input('Enter your email: ')
user_pass = getpass.getpass(prompt='Enter your password: ',stream=None) # Getpass hide's input stream on input

# Connects to IMAP Server
unsub_links = []
imap_obj = imapclient.IMAPClient('imap.gmail.com', ssl=True)
imap_obj.login(user_email, user_pass)
imap_obj.select_folder('INBOX', readonly=True) # reads from your inbox
UIDs = imap_obj.gmail_search('ALL') # searches for everything
raw_messages = imap_obj.fetch(UIDs, ['BODY[]']) # grabs UID from body of email

for i in UIDs:
    raw_message = pyzmail.PyzMessage.factory(raw_messages[i][b'BODY[]'])
    raw_soup = raw_message.html_part.get_payload().decode(raw_message.html_part.charset)
    soup = bs4.BeautifulSoup(raw_soup, 'html.parser')
    link_elems = soup.select('a')
    for unsub in soup.findAll('a'):
        if 'unsubscribe' in str(unsub):
            unsub_links.append(unsub.get('href'))
        
        

imap_obj.logout()

print('Links to unsub:')
print(unsub_links)
