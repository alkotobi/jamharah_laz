unit udtm;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, DB, udb_basic, upaths, db_design, ustrings;

type

  { Tdtm }

  Tdtm = class(TDataModule)
  private
    fconn: TCustomConnection;
    fqry_study: tdataset;
    fqry_title_parent: tdataset;
    fqry_titles: tdataset;
    fqry_matn: tdataset;
    fqry_matn_charh: tdataset;
    fqry_dalil: tdataset;
    fqry_dalil_charh: tdataset;
    fqry_topics: tdataset;
    function get_conn: TCustomConnection;
    function get_qry_dalil: tdataset;
    function get_qry_dalil_charh: tdataset;
    function get_qry_matn: tdataset;
    function get_qry_matn_charh: tdataset;
    function get_qry_study: tdataset;
    function get_qry_titles: tdataset;
    function get_qry_title_parent: tdataset;
    function get_qry_topics: tdataset;
  public
    property conn: TCustomConnection read get_conn;
    property qry_study: tdataset read get_qry_study;
    property qry_titles: tdataset read get_qry_titles;
    property qry_title_parent: tdataset read get_qry_title_parent;
    property qry_matn: tdataset read get_qry_matn;
    property qry_matn_charh: tdataset read get_qry_matn_charh;
    property qry_dalil: tdataset read get_qry_dalil;
    property qry_dalil_charh: tdataset read get_qry_dalil_charh;
    property qry_topics: tdataset read get_qry_topics;
    //dont forget clean text for searching later
    procedure qry_title_name_on_calc_fields(dataset: tdataset);
    procedure qry_matn_befor_post(dataset: tdataset);
    procedure qry_matn_charh_before_post(dataset: tdataset);
    procedure qry_dalil_charh_before_post(dataset: tdataset);
    procedure qry_dalil_before_post(dataset: tdataset);
    procedure qry_title_parent_after_scroll(dataset: tdataset);
    procedure qry_title_parent_before_delete(dataset: tdataset);
    procedure qry_matn_before_delete(dataset: tdataset);
    procedure qry_dalil_before_delete(dataset: tdataset);
    procedure qry_study_before_delete(dataset: tdataset);
    procedure qry_matn_charh_before_delete(dataset: tdataset);
    procedure qry_titles_before_delete(dataset: tdataset);
    procedure qry_titles_before_post(dataset: tdataset);
    procedure qry_study_before_post(dataset: tdataset);
  end;

const
  topic_type_matn = 'matn';
  topic_type_matn_charh = 'matn_charh';
  topic_type_dalil = 'dalil';
  topic_type_dalil_charh = 'dalil_charh';

function make_db_path(db_name_without_ext: string): string;
function get_db_path(): string;

var
  dtm: Tdtm;

const
  jamharah_db_name = 'jamharah';

implementation

{$R *.lfm}

{ Tdtm }

function get_db_path(): string;
begin
  Result := get_documents_dir() + DirectorySeparator + jamharah_db_name;
  if not DirectoryExists(Result) then
    MkDir(Result);
end;



function make_db_path(db_name_without_ext: string): string;
begin
  Result := get_db_path() + DirectorySeparator + db_name_without_ext + '.db';
end;

function Tdtm.get_conn: TCustomConnection;
begin
  if not assigned(fconn) then
  begin
    fconn := connection_create(provider_name_sqlite,
      make_db_path(jamharah_db_name), self);
    fconn.Open;
  end;
  Result := fconn;
end;

function Tdtm.get_qry_dalil: tdataset;
begin
  if not assigned(fqry_dalil) then
  begin
    fqry_dalil := qry_create_with_table_name(conn, topics_table_name,
      self, '*', 'topic_type=:t', [topic_type_dalil]);
    dataset_add_fields(fqry_dalil, db_def, topics_table_name);
    dataset_connect_to_master(fqry_dalil, qry_matn_charh, 'id', topics_id_parent);
    fqry_dalil.BeforePost := qry_dalil_before_post;
    fqry_dalil.BeforeDelete := qry_dalil_before_delete;
    fqry_dalil.Open;
  end;
  Result := fqry_dalil;
end;

function Tdtm.get_qry_dalil_charh: tdataset;
begin
  if not assigned(fqry_dalil_charh) then
  begin
    fqry_dalil_charh := qry_create_with_table_name(
      conn, topics_table_name, self, '*', 'topic_type=:t', [topic_type_dalil_charh]);
    dataset_add_fields(fqry_dalil_charh, db_def, topics_table_name);
    dataset_connect_to_master(fqry_dalil_charh, fqry_dalil, 'id', topics_id_parent);
    fqry_dalil_charh.BeforePost := qry_dalil_charh_before_post;
    fqry_dalil_charh.Open;
  end;
  Result := fqry_dalil_charh;
end;

function Tdtm.get_qry_matn: tdataset;
begin
  if not assigned(fqry_matn) then
  begin
    fqry_matn := qry_create_with_table_name(conn, topics_table_name,
      self, '*', 'topic_type=:t', [topic_type_matn]);
    dataset_add_fields(fqry_matn, db_def, topics_table_name);
    dataset_connect_to_master(fqry_matn, qry_titles, 'id', topics_id_parent);
    fqry_matn.BeforePost := qry_matn_befor_post;
    fqry_matn.BeforeDelete := qry_matn_before_delete;
    fqry_matn.Open;
  end;
  Result := fqry_matn;
end;

function Tdtm.get_qry_matn_charh: tdataset;
begin
  if not assigned(fqry_matn_charh) then
  begin
    fqry_matn_charh := qry_create_with_table_name(
      conn, topics_table_name, self, '*', 'topic_type=:t', [topic_type_matn_charh]);
    dataset_add_fields(fqry_matn_charh, db_def, topics_table_name);
    dataset_connect_to_master(fqry_matn_charh, fqry_matn, 'id', topics_id_parent);
    fqry_matn_charh.BeforePost := qry_matn_charh_before_post;
    fqry_matn_charh.BeforeDelete := qry_matn_charh_before_delete;
    fqry_matn_charh.Open;
  end;
  Result := fqry_matn_charh;
end;

function Tdtm.get_qry_study: tdataset;
begin
  if not Assigned(fqry_study) then
  begin
    fqry_study := qry_create_with_table_name(conn, studies_table_name, self);
    dataset_add_fields(fqry_study, db_def, studies_table_name);
    fqry_study.BeforeDelete := qry_study_before_delete;
    fqry_study.BeforePost := qry_study_before_post();
    fqry_study.Open;
  end;
  Result := fqry_study;
end;

function Tdtm.get_qry_titles: tdataset;
begin
  if not Assigned(fqry_titles) then
  begin
    fqry_titles := qry_create_with_table_name(self.conn, titles_table_name, self);
    dataset_add_fields(fqry_titles, db_def, titles_table_name);
    fqry_titles.BeforeDelete := qry_titles_before_delete;
    fqry_titles.BeforePost := qry_titles_before_post;
    fqry_titles.Open;
  end;
  Result := fqry_titles;
end;

function Tdtm.get_qry_title_parent: tdataset;
begin
  if not Assigned(fqry_title_parent) then
  begin
    fqry_title_parent := qry_create_with_sql(
      conn, 'SELECT * from title_parent', [], self);
    qry_create_with_table_name(self.conn, title_parent_table_name, self);
    dataset_add_fields(fqry_title_parent, db_def, title_parent_table_name);
    dataset_connect_to_master(fqry_title_parent, qry_study, 'id', title_parent_id_study);
    fqry_title_parent.OnCalcFields := qry_title_name_on_calc_fields;
    fqry_title_parent.AfterScroll := qry_title_parent_after_scroll;
    fqry_title_parent.BeforeDelete := qry_title_parent_before_delete;
    fqry_title_parent.Open;
  end;
  Result := fqry_title_parent;
end;

function Tdtm.get_qry_topics: tdataset;
begin
  if not assigned(fqry_topics) then
  begin
    fqry_topics := qry_create_with_table_name(conn, topics_table_name, self);
    dataset_add_fields(fqry_topics, db_def, topics_table_name);
    fqry_topics.Open;
  end;
  Result := fqry_topics;
end;



procedure Tdtm.qry_title_name_on_calc_fields(dataset: tdataset);
var
  qry: tdataset;
begin
  qry := qry_create_with_table_name(dtm.conn, titles_table_name);
  try
    qry.Open;
    if not dataset.FieldByName(title_parent_id_parent).IsNull then
    begin
      if qry.Locate('id', dataset.FieldByName(title_parent_id_parent).Value, []) then
        dataset.FieldByName(title_parent_parent).AsString :=
          qry.FieldByName(titles_title).AsString;
    end;
    if not dataset.FieldByName(title_parent_id_title).IsNull then
    begin
      if qry.Locate('id', dataset.FieldByName(title_parent_id_title).Value, []) then
        dataset.FieldByName(title_parent_title).AsString :=
          qry.FieldByName(titles_title).AsString;
    end;
  finally
    qry.Free;
  end;
end;

procedure Tdtm.qry_matn_befor_post(dataset: tdataset);
begin
  dataset.FieldByName(topics_topic_type).AsString := topic_type_matn;
  dataset.FieldByName(topics_topic_clean).AsString :=
    get_clean_text(dataset.FieldByName(topics_topic).AsString);
end;

procedure Tdtm.qry_matn_charh_before_post(dataset: tdataset);
begin
  dataset.FieldByName(topics_topic_type).AsString := topic_type_matn_charh;
  dataset.FieldByName(topics_topic_clean).AsString :=
    get_clean_text(dataset.FieldByName(topics_topic).AsString);

end;

procedure Tdtm.qry_dalil_charh_before_post(dataset: tdataset);
begin
  dataset.FieldByName(topics_topic_type).AsString := topic_type_dalil_charh;
  dataset.FieldByName(topics_topic_clean).AsString :=
    get_clean_text(dataset.FieldByName(topics_topic).AsString);

end;

procedure Tdtm.qry_dalil_before_post(dataset: tdataset);
begin
  dataset.FieldByName(topics_topic_type).AsString := topic_type_dalil;
  dataset.FieldByName(topics_topic_clean).AsString :=
    get_clean_text(dataset.FieldByName(topics_topic).AsString);

end;

procedure Tdtm.qry_title_parent_after_scroll(dataset: tdataset);
begin
  qry_titles.Locate('id', dataset.FieldByName(title_parent_id_title).AsInteger, []);
end;



procedure Tdtm.qry_title_parent_before_delete(dataset: tdataset);
var
  bk: tbookmark;
  delete_title: boolean;
begin
  //delete_title := False;
  //bk := qry_title_parent.GetBookmark;
  //qry_title_parent.DisableControls;
  //qry_title_parent.Filter := title_parent_id_title + '=' +
  //  qry_title_parent.FieldByName(title_parent_id_title).AsString;
  //qry_title_parent.Filtered := True;
  //if qry_title_parent.RecordCount = 1 then
  //begin
  //  delete_title := True;
  //end;
  //qry_title_parent.Filtered := False;
  //qry_title_parent.GotoBookmark(bk);
  //qry_title_parent.EnableControls;
  //if delete_title then
  //  qry_titles.Delete;
end;

procedure Tdtm.qry_matn_before_delete(dataset: tdataset);
begin
  qry_matn_charh.First;
  while not qry_matn_charh.EOF do qry_matn_charh.Delete;
end;

procedure Tdtm.qry_dalil_before_delete(dataset: tdataset);
begin
  qry_dalil_charh.First;
  while not qry_dalil_charh.EOF do qry_dalil_charh.Delete;
end;

procedure Tdtm.qry_study_before_delete(dataset: tdataset);
begin
  qry_title_parent.First;
  while not qry_title_parent.EOF do qry_title_parent.Delete;
end;

procedure Tdtm.qry_matn_charh_before_delete(dataset: tdataset);
begin
  qry_dalil.First;
  while not qry_dalil.EOF do qry_dalil.Delete;
end;

procedure Tdtm.qry_titles_before_delete(dataset: tdataset);
begin
  qry_matn.First;
  while not qry_matn.EOF do
    qry_matn.Delete;
end;

procedure Tdtm.qry_titles_before_post(dataset: tdataset);
begin
  dataset.FieldByName(titles_title_clean).AsString :=
    get_clean_text(dataset.FieldByName(titles_title).AsString);
end;

procedure Tdtm.qry_study_before_post(dataset: tdataset);
begin
  dataset.FieldByName(studies_study_clean).AsString :=
    get_clean_text(dataset.FieldByName(studies_study).AsString);
end;

end.
