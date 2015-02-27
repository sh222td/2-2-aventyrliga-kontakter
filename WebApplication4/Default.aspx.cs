using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication4.Model;

namespace WebApplication4
{
    public partial class Default : System.Web.UI.Page
    {
        private Service _service;

        private Service Service
        {
            // Hämtar Service klassobjektet om det redan finns, annars skapas ett nytt.
            get { return _service ?? (_service = new Service()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        
        public IEnumerable<Contact> ContactListView_GetData(int maximumRows, int startRowIndex, out int totalRowCount)
        {
            try
            {
                Service.GetContactsPageWise(maximumRows, startRowIndex, out totalRowCount);
            }
            catch
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontakterna skulle läsas ut.");
                totalRowCount = 0;
                return null;
            }
            return Service.GetContactsPageWise(maximumRows, startRowIndex, out totalRowCount);
        }

        public void ContactListView_InsertItem(Contact contact)
        {
            if (IsValid)
            {
                try
                {
                    Service.SaveContact(contact);
                    PlaceholderMSG.Visible = true;
                }
                catch (ValidationException ex)
                {
                    foreach (var vrf in ex.Data["ValidationResults"] as ICollection<ValidationResult>)
                    {
                        ModelState.AddModelError(String.Empty, vrf.ErrorMessage);
                    }
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle läggas till.");
                }
            }
        }

        public void ContactListView_UpdateItem(int contactId)
        {
            if (IsValid)
            {
                try
                {
                    var contact = Service.GetContact(contactId);
                    if (contact == null)
                    {
                        // Hittade inte kunden.
                        ModelState.AddModelError(String.Empty, String.Format("Kunden med kontaktnummer {0} hittades inte.", contactId));
                        return;
                    }

                    if (TryUpdateModel(contact))
                    {
                        Service.SaveContact(contact);
                    }
                }
                catch (ValidationException ex)
                {
                    foreach (var vrf in ex.Data["ValidationResults"] as ICollection<ValidationResult>)
                    {
                        ModelState.AddModelError(String.Empty, vrf.ErrorMessage);
                    }
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle uppdateras.");
                }
            }
        }

        public void ContactListView_DeleteItem(int contactId)
        {
            try
            {
                Service.DeleteContact(contactId);
                Placeholder2.Visible = true;
            }
                
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle tas bort.");
            }
        }
    }
}