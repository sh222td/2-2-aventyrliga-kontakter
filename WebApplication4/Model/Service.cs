using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication4.Model
{
    public class Service
    {
        private ContactDAL _contactDAL;
    
        public ContactDAL ContactDAL
        {
            get { return _contactDAL ?? (_contactDAL = new ContactDAL()); }
        }

        public void DeleteContact(Contact contact)
        {
            throw new System.NotImplementedException();
        }

        public void DeleteContact(int contactId)
        {
            ContactDAL.DeleteContact(contactId);
        }

        public Contact GetContact(int contactId)
        {
            return ContactDAL.GetContactById(contactId);
        }

        public IEnumerable<Contact> GetContacts()
        {
            return ContactDAL.GetContacts();
        }

        public void GetContactsPageWise(int maximumRows, int startRowIndex, out int totalRowCount)
        {
            throw new System.NotImplementedException();
        }

        public void SaveContact(Contact contact)
        {
            if (contact.ContactId == 0) // Ny post om CustomerId är 0!
            {
                ContactDAL.InsertContact(contact);
            }
            else
            {
                ContactDAL.UpdateContact(contact);
            }
        }
    }
}