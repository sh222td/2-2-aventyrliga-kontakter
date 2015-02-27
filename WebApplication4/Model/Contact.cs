using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication4.Model
{
    public class Contact
    {
        public int ContactId { get; set; }

        [Required(ErrorMessage = "Fyll i email fältet!")]
        [StringLength(50, ErrorMessage = "Namnet kan bestå av maximalt 50 tecken.")]
        [RegularExpression(@"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", ErrorMessage = "Otillåtna tecken i mailen!")]
        public string EmailAddress { get; set; }

        [Required(ErrorMessage = "Fyll i förnamn fältet!")]
        [StringLength(50, ErrorMessage = "Namnet kan bestå av maximalt 50 tecken.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Fyll i efternamn fältet!")]
        [StringLength(50, ErrorMessage = "Namnet kan bestå av maximalt 50 tecken.")]
        public string LastName { get; set; }
    }
}