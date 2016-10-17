# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "app", primary_key: "App_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "Project_ID",   limit: 50,  null: false
    t.string   "Owner_ID",     limit: 50
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "app", ["Owner_ID"], name: "FK_AppOwner_ID", using: :btree
  add_index "app", ["Project_ID"], name: "FK_Project_ID", using: :btree

  create_table "appversion", primary_key: "AppVersion_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "App_ID",       limit: 50,  null: false
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "appversion", ["App_ID"], name: "FK_App_ID", using: :btree

  create_table "company", primary_key: "Company_ID", force: :cascade do |t|
    t.string   "Name",         limit: 300, null: false
    t.string   "Description",  limit: 300
    t.string   "ABN_Number",   limit: 50
    t.string   "Address1",     limit: 150
    t.string   "Address2",     limit: 150
    t.string   "Suburb",       limit: 100
    t.string   "City",         limit: 100
    t.string   "Postal_Code",  limit: 15
    t.string   "Country",      limit: 100
    t.string   "Mobile",       limit: 100
    t.string   "Phone",        limit: 100
    t.string   "Fax",          limit: 100
    t.string   "Email",        limit: 500
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "customer", id: false, force: :cascade do |t|
    t.string   "Client_ID",           limit: 50,   null: false
    t.string   "Branch",              limit: 100,  null: false
    t.string   "Password_Hash",       limit: 1000, null: false
    t.string   "Password_Salt",       limit: 1000, null: false
    t.string   "Company_Name",        limit: 150,  null: false
    t.string   "Title",               limit: 50
    t.string   "First_Name",          limit: 100,  null: false
    t.string   "Middle_Name",         limit: 100
    t.string   "Last_Name",           limit: 100
    t.string   "Gender",              limit: 1
    t.string   "Address1",            limit: 150
    t.string   "Address2",            limit: 150
    t.string   "Suburb",              limit: 100
    t.string   "City",                limit: 100
    t.string   "Postal_Code",         limit: 15
    t.string   "Country",             limit: 100
    t.string   "Mobile",              limit: 100
    t.string   "Phone",               limit: 100
    t.string   "Fax",                 limit: 100
    t.string   "Email",               limit: 500
    t.string   "Product",             limit: 200,  null: false
    t.date     "Support_Expiry_Date"
    t.string   "LOP_ID",              limit: 50,   null: false
    t.datetime "LOP_Datetime",                     null: false
  end

  create_table "department", primary_key: "Department_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "designation", primary_key: "Designation_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "employee", primary_key: "Emp_ID", force: :cascade do |t|
    t.string   "Password_Hash",  limit: 1000,               null: false
    t.string   "Password_Salt",  limit: 1000,               null: false
    t.string   "Company_ID",     limit: 50
    t.string   "Title",          limit: 50
    t.string   "First_Name",     limit: 100,                null: false
    t.string   "Middle_Name",    limit: 100
    t.string   "Last_Name",      limit: 100
    t.string   "Gender",         limit: 1
    t.date     "DOB"
    t.date     "DOJ"
    t.string   "Terminated_IND", limit: 1,    default: "N"
    t.string   "Department_ID",  limit: 50,                 null: false
    t.string   "Designation_ID", limit: 50,                 null: false
    t.string   "Manager_ID",     limit: 50
    t.string   "Address1",       limit: 150
    t.string   "Address2",       limit: 150
    t.string   "Suburb",         limit: 100
    t.string   "City",           limit: 100
    t.string   "Postal_Code",    limit: 15
    t.string   "Country",        limit: 100
    t.string   "Mobile",         limit: 100
    t.string   "Phone",          limit: 100
    t.string   "Fax",            limit: 100
    t.string   "Email",          limit: 500
    t.string   "LOP_ID",         limit: 50,                 null: false
    t.datetime "LOP_Datetime",                              null: false
  end

  add_index "employee", ["Company_ID"], name: "FK_Company_ID", using: :btree
  add_index "employee", ["Department_ID"], name: "FK_Department_ID", using: :btree
  add_index "employee", ["Designation_ID"], name: "FK_Designation_ID", using: :btree

  create_table "imsconfig", primary_key: "IMSConfig_ID", force: :cascade do |t|
    t.string   "Name",           limit: 150,        null: false
    t.string   "Description",    limit: 300
    t.integer  "Value_Integer",  limit: 8
    t.float    "Value_Decimal",  limit: 53
    t.date     "Value_Date"
    t.datetime "Value_Datetime"
    t.time     "Value_Time"
    t.text     "Value_String",   limit: 4294967295
    t.string   "LOP_ID",         limit: 50,         null: false
    t.datetime "LOP_Datetime",                      null: false
  end

  create_table "issue", primary_key: "Issue_ID", force: :cascade do |t|
    t.string   "Issue_No",           limit: 50,         null: false
    t.string   "Client_ID",          limit: 50
    t.string   "Branch",             limit: 100
    t.string   "First_Name",         limit: 100
    t.string   "Last_Name",          limit: 100
    t.string   "Project_ID",         limit: 50,         null: false
    t.string   "RequestType_ID",     limit: 50,         null: false
    t.string   "App_ID",             limit: 50
    t.string   "AppVersion_ID",      limit: 50
    t.string   "Fix_Version",        limit: 2
    t.string   "Module_ID",          limit: 50
    t.string   "Program_ID",         limit: 50
    t.text     "Issue_Summary",      limit: 65535,      null: false
    t.text     "Issue_Description",  limit: 4294967295
    t.string   "Client_Priority_ID", limit: 50
    t.datetime "Due_Datetime"
    t.string   "Can_Replicate",      limit: 1
    t.string   "IssueStatus_ID",     limit: 50
    t.string   "IssueLabel_ID",      limit: 50
    t.string   "IssueTag_ID",        limit: 50
    t.string   "IssueSource_ID",     limit: 50,         null: false
    t.string   "Issue_Priority_ID",  limit: 50
    t.string   "Patch_ID",           limit: 50
    t.text     "Patch_Note",         limit: 65535
    t.string   "AssignTo_ID",        limit: 50
    t.string   "Repoter_ID",         limit: 50
    t.string   "ResolvedBy_ID",      limit: 50
    t.string   "Tester_ID",          limit: 50
    t.integer  "Creator_ID",         limit: 4,          null: false
    t.datetime "Created_Datetime",                      null: false
    t.string   "LOP_ID",             limit: 50,         null: false
    t.datetime "LOP_Datetime",                          null: false
  end

  add_index "issue", ["AppVersion_ID"], name: "FK_IssueAppVersion_ID", using: :btree
  add_index "issue", ["App_ID"], name: "FK_IssueApp_ID", using: :btree
  add_index "issue", ["AssignTo_ID"], name: "FK_IssueAssignTo_ID", using: :btree
  add_index "issue", ["Client_ID", "Branch"], name: "FK_IssueClient_ID", using: :btree
  add_index "issue", ["Client_Priority_ID"], name: "FK_IssueClient_Priority_ID", using: :btree
  add_index "issue", ["IssueLabel_ID"], name: "FK_IssueIssueLabel_ID", using: :btree
  add_index "issue", ["IssueSource_ID"], name: "FK_IssueIssueSource_ID", using: :btree
  add_index "issue", ["IssueStatus_ID"], name: "FK_IssueIssueStatus_ID", using: :btree
  add_index "issue", ["IssueTag_ID"], name: "FK_IssueIssueTag_ID", using: :btree
  add_index "issue", ["Issue_Priority_ID"], name: "FK_IssueIssue_Priority_ID", using: :btree
  add_index "issue", ["Module_ID"], name: "FK_IssueModule_ID", using: :btree
  add_index "issue", ["Program_ID"], name: "FK_IssueProgram_ID", using: :btree
  add_index "issue", ["Project_ID"], name: "FK_IssueProject_ID", using: :btree
  add_index "issue", ["Repoter_ID"], name: "FK_IssueRepoter_ID", using: :btree
  add_index "issue", ["RequestType_ID"], name: "FK_IssueRequestType_ID", using: :btree
  add_index "issue", ["ResolvedBy_ID"], name: "FK_IssueResolvedBy_ID", using: :btree
  add_index "issue", ["Tester_ID"], name: "FK_IssueTester_ID", using: :btree

  create_table "issueattachment", primary_key: "IssueAttachment_ID", force: :cascade do |t|
    t.integer  "Issue_ID",     limit: 8,   null: false
    t.string   "Description",  limit: 300
    t.string   "FileName",     limit: 150
    t.string   "FileLocation", limit: 500
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "issueattachment", ["Issue_ID"], name: "FK_IssueAttachmentIssue_ID", using: :btree

  create_table "issuelabel", primary_key: "IssueLabel_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "issuesource", primary_key: "IssueSource_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "issuestatus", primary_key: "IssueStatus_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "issuetag", primary_key: "IssueTag_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "module", primary_key: "Module_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "App_ID",       limit: 50,  null: false
    t.string   "Owner_ID",     limit: 50
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "module", ["App_ID"], name: "FK_ModuleApp_ID", using: :btree
  add_index "module", ["Owner_ID"], name: "FK_ModuleOwner_ID", using: :btree

  create_table "note", primary_key: "Note_ID", force: :cascade do |t|
    t.string   "NoteType_ID",  limit: 50,         null: false
    t.integer  "Issue_ID",     limit: 8,          null: false
    t.string   "Noter_ID",     limit: 50
    t.datetime "NoteDateTime",                    null: false
    t.text     "Description",  limit: 4294967295
    t.string   "LOP_ID",       limit: 50,         null: false
    t.datetime "LOP_Datetime",                    null: false
  end

  add_index "note", ["Issue_ID"], name: "FK_NotesIssue_ID", using: :btree
  add_index "note", ["NoteType_ID"], name: "FK_NotesNoteType_ID", using: :btree
  add_index "note", ["Noter_ID"], name: "FK_NotesNoter_ID", using: :btree

  create_table "notetype", primary_key: "NoteType_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "pbcatcol", id: false, force: :cascade do |t|
    t.string  "pbc_tnam", limit: 193, null: false
    t.integer "pbc_tid",  limit: 4
    t.string  "pbc_ownr", limit: 193, null: false
    t.string  "pbc_cnam", limit: 193, null: false
    t.integer "pbc_cid",  limit: 2
    t.string  "pbc_labl", limit: 254
    t.integer "pbc_lpos", limit: 2
    t.string  "pbc_hdr",  limit: 254
    t.integer "pbc_hpos", limit: 2
    t.integer "pbc_jtfy", limit: 2
    t.string  "pbc_mask", limit: 31
    t.integer "pbc_case", limit: 2
    t.integer "pbc_hght", limit: 2
    t.integer "pbc_wdth", limit: 2
    t.string  "pbc_ptrn", limit: 31
    t.string  "pbc_bmap", limit: 1
    t.string  "pbc_init", limit: 254
    t.string  "pbc_cmnt", limit: 254
    t.string  "pbc_edit", limit: 31
    t.string  "pbc_tag",  limit: 254
  end

  add_index "pbcatcol", ["pbc_tnam", "pbc_ownr", "pbc_cnam"], name: "pbcatc_x", unique: true, using: :btree

  create_table "pbcatedt", id: false, force: :cascade do |t|
    t.string  "pbe_name", limit: 30,  null: false
    t.string  "pbe_edit", limit: 254
    t.integer "pbe_type", limit: 2
    t.integer "pbe_cntr", limit: 4
    t.integer "pbe_seqn", limit: 2,   null: false
    t.integer "pbe_flag", limit: 4
    t.string  "pbe_work", limit: 32
  end

  add_index "pbcatedt", ["pbe_name", "pbe_seqn"], name: "pbcate_x", unique: true, using: :btree

  create_table "pbcatfmt", id: false, force: :cascade do |t|
    t.string  "pbf_name", limit: 30,  null: false
    t.string  "pbf_frmt", limit: 254
    t.integer "pbf_type", limit: 2
    t.integer "pbf_cntr", limit: 4
  end

  add_index "pbcatfmt", ["pbf_name"], name: "pbcatf_x", unique: true, using: :btree

  create_table "pbcattbl", id: false, force: :cascade do |t|
    t.string  "pbt_tnam", limit: 193, null: false
    t.integer "pbt_tid",  limit: 4
    t.string  "pbt_ownr", limit: 193, null: false
    t.integer "pbd_fhgt", limit: 2
    t.integer "pbd_fwgt", limit: 2
    t.string  "pbd_fitl", limit: 1
    t.string  "pbd_funl", limit: 1
    t.integer "pbd_fchr", limit: 2
    t.integer "pbd_fptc", limit: 2
    t.string  "pbd_ffce", limit: 18
    t.integer "pbh_fhgt", limit: 2
    t.integer "pbh_fwgt", limit: 2
    t.string  "pbh_fitl", limit: 1
    t.string  "pbh_funl", limit: 1
    t.integer "pbh_fchr", limit: 2
    t.integer "pbh_fptc", limit: 2
    t.string  "pbh_ffce", limit: 18
    t.integer "pbl_fhgt", limit: 2
    t.integer "pbl_fwgt", limit: 2
    t.string  "pbl_fitl", limit: 1
    t.string  "pbl_funl", limit: 1
    t.integer "pbl_fchr", limit: 2
    t.integer "pbl_fptc", limit: 2
    t.string  "pbl_ffce", limit: 18
    t.string  "pbt_cmnt", limit: 254
  end

  add_index "pbcattbl", ["pbt_tnam", "pbt_ownr"], name: "pbcatt_x", unique: true, using: :btree

  create_table "pbcatvld", id: false, force: :cascade do |t|
    t.string  "pbv_name", limit: 30,  null: false
    t.string  "pbv_vald", limit: 254
    t.integer "pbv_type", limit: 2
    t.integer "pbv_cntr", limit: 4
    t.string  "pbv_msg",  limit: 254
  end

  add_index "pbcatvld", ["pbv_name"], name: "pbcatv_x", unique: true, using: :btree

  create_table "priority", primary_key: "Priority_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  create_table "program", primary_key: "Program_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "Module_ID",    limit: 50,  null: false
    t.string   "Owner_ID",     limit: 50
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "program", ["Module_ID"], name: "FK_ProgramModule_ID", using: :btree
  add_index "program", ["Owner_ID"], name: "FK_ProgramOwner_ID", using: :btree

  create_table "project", primary_key: "Project_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "Owner_ID",     limit: 50
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "project", ["Owner_ID"], name: "FK_Owner_ID", using: :btree

  create_table "requesttype", primary_key: "RequestType_ID", force: :cascade do |t|
    t.string   "Name",         limit: 150, null: false
    t.string   "Description",  limit: 300
    t.string   "Project_ID",   limit: 50,  null: false
    t.string   "Owner_ID",     limit: 50
    t.string   "LOP_ID",       limit: 50,  null: false
    t.datetime "LOP_Datetime",             null: false
  end

  add_index "requesttype", ["Owner_ID"], name: "FK_RequestTypeOwner_ID", using: :btree
  add_index "requesttype", ["Project_ID"], name: "FK_RequestTypeProject_ID", using: :btree

  create_table "timetracker", primary_key: "TimeTracker_ID", force: :cascade do |t|
    t.integer  "Issue_ID",      limit: 8,   null: false
    t.string   "Attacher_ID",   limit: 50
    t.string   "Description",   limit: 300
    t.datetime "StartDateTime"
    t.datetime "EndDateTime"
    t.integer  "TotalHours",    limit: 4
    t.string   "LOP_ID",        limit: 50,  null: false
    t.datetime "LOP_Datetime",              null: false
  end

  add_index "timetracker", ["Attacher_ID"], name: "FK_TimeTrackerAttacher_ID", using: :btree
  add_index "timetracker", ["Issue_ID"], name: "FK_TimeTrackerIssue_ID", using: :btree

  add_foreign_key "app", "employee", column: "Owner_ID", primary_key: "Emp_ID", name: "FK_AppOwner_ID", on_update: :cascade
  add_foreign_key "app", "project", column: "Project_ID", primary_key: "Project_ID", name: "FK_Project_ID", on_update: :cascade
  add_foreign_key "appversion", "app", column: "App_ID", primary_key: "App_ID", name: "FK_App_ID", on_update: :cascade
  add_foreign_key "employee", "company", column: "Company_ID", primary_key: "Company_ID", name: "FK_Company_ID", on_update: :cascade
  add_foreign_key "employee", "department", column: "Department_ID", primary_key: "Department_ID", name: "FK_Department_ID", on_update: :cascade
  add_foreign_key "employee", "designation", column: "Designation_ID", primary_key: "Designation_ID", name: "FK_Designation_ID", on_update: :cascade
  add_foreign_key "issue", "app", column: "App_ID", primary_key: "App_ID", name: "FK_IssueApp_ID", on_update: :cascade
  add_foreign_key "issue", "appversion", column: "AppVersion_ID", primary_key: "AppVersion_ID", name: "FK_IssueAppVersion_ID", on_update: :cascade
  add_foreign_key "issue", "customer", column: "Branch", primary_key: "Branch", name: "FK_IssueClient_ID", on_update: :cascade
  add_foreign_key "issue", "customer", column: "Client_ID", primary_key: "Client_ID", name: "FK_IssueClient_ID", on_update: :cascade
  add_foreign_key "issue", "employee", column: "AssignTo_ID", primary_key: "Emp_ID", name: "FK_IssueAssignTo_ID", on_update: :cascade
  add_foreign_key "issue", "employee", column: "Repoter_ID", primary_key: "Emp_ID", name: "FK_IssueRepoter_ID", on_update: :cascade
  add_foreign_key "issue", "employee", column: "ResolvedBy_ID", primary_key: "Emp_ID", name: "FK_IssueResolvedBy_ID", on_update: :cascade
  add_foreign_key "issue", "employee", column: "Tester_ID", primary_key: "Emp_ID", name: "FK_IssueTester_ID", on_update: :cascade
  add_foreign_key "issue", "issuelabel", column: "IssueLabel_ID", primary_key: "IssueLabel_ID", name: "FK_IssueIssueLabel_ID", on_update: :cascade
  add_foreign_key "issue", "issuesource", column: "IssueSource_ID", primary_key: "IssueSource_ID", name: "FK_IssueIssueSource_ID", on_update: :cascade
  add_foreign_key "issue", "issuestatus", column: "IssueStatus_ID", primary_key: "IssueStatus_ID", name: "FK_IssueIssueStatus_ID", on_update: :cascade
  add_foreign_key "issue", "issuetag", column: "IssueTag_ID", primary_key: "IssueTag_ID", name: "FK_IssueIssueTag_ID", on_update: :cascade
  add_foreign_key "issue", "module", column: "Module_ID", primary_key: "Module_ID", name: "FK_IssueModule_ID", on_update: :cascade
  add_foreign_key "issue", "priority", column: "Client_Priority_ID", primary_key: "Priority_ID", name: "FK_IssueClient_Priority_ID", on_update: :cascade
  add_foreign_key "issue", "priority", column: "Issue_Priority_ID", primary_key: "Priority_ID", name: "FK_IssueIssue_Priority_ID", on_update: :cascade
  add_foreign_key "issue", "program", column: "Program_ID", primary_key: "Program_ID", name: "FK_IssueProgram_ID", on_update: :cascade
  add_foreign_key "issue", "project", column: "Project_ID", primary_key: "Project_ID", name: "FK_IssueProject_ID", on_update: :cascade
  add_foreign_key "issue", "requesttype", column: "RequestType_ID", primary_key: "RequestType_ID", name: "FK_IssueRequestType_ID", on_update: :cascade
  add_foreign_key "issueattachment", "issue", column: "Issue_ID", primary_key: "Issue_ID", name: "FK_IssueAttachmentIssue_ID", on_update: :cascade
  add_foreign_key "module", "app", column: "App_ID", primary_key: "App_ID", name: "FK_ModuleApp_ID", on_update: :cascade
  add_foreign_key "module", "employee", column: "Owner_ID", primary_key: "Emp_ID", name: "FK_ModuleOwner_ID", on_update: :cascade
  add_foreign_key "note", "employee", column: "Noter_ID", primary_key: "Emp_ID", name: "FK_NotesNoter_ID", on_update: :cascade
  add_foreign_key "note", "issue", column: "Issue_ID", primary_key: "Issue_ID", name: "FK_NotesIssue_ID", on_update: :cascade
  add_foreign_key "note", "notetype", column: "NoteType_ID", primary_key: "NoteType_ID", name: "FK_NotesNoteType_ID", on_update: :cascade
  add_foreign_key "program", "employee", column: "Owner_ID", primary_key: "Emp_ID", name: "FK_ProgramOwner_ID", on_update: :cascade
  add_foreign_key "program", "module", column: "Module_ID", primary_key: "Module_ID", name: "FK_ProgramModule_ID", on_update: :cascade
  add_foreign_key "project", "employee", column: "Owner_ID", primary_key: "Emp_ID", name: "FK_Owner_ID", on_update: :cascade
  add_foreign_key "requesttype", "employee", column: "Owner_ID", primary_key: "Emp_ID", name: "FK_RequestTypeOwner_ID", on_update: :cascade
  add_foreign_key "requesttype", "project", column: "Project_ID", primary_key: "Project_ID", name: "FK_RequestTypeProject_ID", on_update: :cascade
  add_foreign_key "timetracker", "employee", column: "Attacher_ID", primary_key: "Emp_ID", name: "FK_TimeTrackerAttacher_ID", on_update: :cascade
  add_foreign_key "timetracker", "issue", column: "Issue_ID", primary_key: "Issue_ID", name: "FK_TimeTrackerIssue_ID", on_update: :cascade
end
