﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.SqlClient;

namespace Blacksmith.Models
{
    public class Link
    {
        [Key, ScaffoldColumn(false)]
        public int Id { get; set; }

        [Required, StringLength(100)]
        public string Title { get; set; }

        [Required, StringLength(100)]
        public string Address { get; set; }

        [StringLength(1000), DataType(DataType.MultilineText)]
        public string Description { get; set; }
        
        [Required]
        public virtual User Submitter { get; set; }

        [Required, DataType(DataType.DateTime)]
        public DateTime Date { get; set; }

//        [ForeignKey("Id")]
        public virtual ICollection<Comment> Comments { get; set; }


        // Use services to provide favicon and thumbnail
        [NotMapped]
        public string Favicon => $@"http://www.google.com/s2/favicons?domain_url={Address}";
        [NotMapped]
        public string Thumbnail => $@"http://images.shrinktheweb.com/xino.php?stwembed=1&stwxmax=320&stwymax=240&stwaccesskeyid=c7fc29b382dca49&stwurl=http://{Address}";

        
    }

    public class LinkManager
    {
        // Create
        public static int Insert(Link link)
        {
            return 0;
//            var connection = DatabaseHelper.NewConnection();
//
//            // TODO put link.submitterId here
//            string query = "Insert Into links(Title, Description, Address, Submitter, Date) " +
//                           $"Values('{link.Title}', '{link.Description}', '{link.Address}', 'submitterId', '{link.Date}'); " +
//                           "Select @@Identity";
//            var command = new SqlCommand(query, connection);
//
//            int newLinkId = Convert.ToInt32(command.ExecuteScalar());
//
//            DatabaseHelper.Cleanup(connection, command);
//            return newLinkId;
        }

        // Read
        public static List<Link> ExecuteSelect(string query)
        {
            return null;
//            var connection = DatabaseHelper.NewConnection();
//
//            var command = new SqlCommand(query, connection);
//            var reader = command.ExecuteReader();
//
//            var links = new List<Link>();
//            if (reader.HasRows)
//                while (reader.Read())
//                    links.Add(new Link(reader));
//
//            DatabaseHelper.Cleanup(connection, command);
//            return links;
        }

        // Update
        public static int Update(string field, string value, int id)
        {
            return 0;
//            var connection = DatabaseHelper.NewConnection();
//
//            string query =  "Update links " +
//                           $"Set    {field} = '{value}', " +
//                           $"       date    = '{DateTime.Now}'" +
//                           $"Where  id = {id}";
//            var command = new SqlCommand(query, connection);
//            int rowsUpdated = command.ExecuteNonQuery();
//
//            DatabaseHelper.Cleanup(connection, command);
//            return rowsUpdated;
        }

        // Delete
        public static bool Delete(int id)
        {
            return false;
//            var connection = DatabaseHelper.NewConnection();
//            var command = new SqlCommand($"Delete From Links Where id = {id}", connection);
//
//            int rowsDeleted = command.ExecuteNonQuery();
//
//            DatabaseHelper.Cleanup(connection, command);
//            return rowsDeleted != 0;
        }
    }
}