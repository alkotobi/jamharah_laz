unit umain;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, DBCtrls, DBGrids, Buttons, virtualdbtreeex, VirtualTrees, udtm, ugui, db_design, udb_basic,LCLIntf;

type

  { Tfrm_main }

  Tfrm_main = class(TForm)
    btn_add_title: TButton;
    cmb_title: TComboBox;
    cmb_study: TComboBox;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    db_nav: TDBNavigator;
    db_nav_sheet_2: TDBNavigator;
    dts_topics: TDataSource;
    grd_topics: TDBGrid;
    dts_matn: TDataSource;
    grd_titles: TDBGrid;
    grd_title_parent: TDBGrid;
    dts_charh_matn: TDataSource;
    dts_dalil: TDataSource;
    dts_charh_dalil: TDataSource;
    dts_titles: TDataSource;
    dts_title_parent: TDataSource;
    GroupBox1: TPanel;
    GroupBox2: TPanel;
    GroupBox3: TPanel;
    GroupBox4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mem_charh_dalil: TDBMemo;
    mem_charh_matn: TDBMemo;
    mem_dalil: TDBMemo;
    mem_matn: TDBMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;

    dbtree: TVirtualDBTreeEx;
    procedure btn_add_titleClick(Sender: TObject);
    procedure cmb_studySelect(Sender: TObject);
    procedure cmb_titleEnter(Sender: TObject);
    procedure grd_titlesEnter(Sender: TObject);
    procedure mem_matnEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure combo_study_on_validate(Sender: TObject; str: string);
    procedure mem_matnExit(Sender: TObject);
  private

  public
    combo_title: mncombobox;
    combo_study: mncombobox;
  end;


var
  frm_main: Tfrm_main;

function frm_main_create(): Tfrm_main;

implementation

{$R *.lfm}

{ Tfrm_main }

function frm_main_create(): Tfrm_main;
begin
  frm_main := Tfrm_main.Create(Application);
  frm_main.dts_titles.DataSet := dtm.qry_titles;
  frm_main.dts_title_parent.DataSet := dtm.qry_title_parent;
  frm_main.dts_matn.DataSet := dtm.qry_matn;
  frm_main.dts_charh_matn.DataSet := dtm.qry_matn_charh;
  frm_main.dts_dalil.DataSet := dtm.qry_dalil;
  frm_main.dts_charh_dalil.DataSet := dtm.qry_dalil_charh;
  frm_main.dts_topics.DataSet := dtm.qry_topics;
  frm_main.combo_title.init_from_dataset(frm_main.cmb_title, dtm.qry_titles,
    titles_title);
  frm_main.combo_study.on_validate := frm_main.combo_study_on_validate;
  frm_main.combo_study.init_from_dataset(frm_main.cmb_study, dtm.qry_study,
    studies_study);
  Result := frm_main;
end;


procedure Tfrm_main.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := TCloseAction.caFree;
  application.Terminate;
end;

procedure Tfrm_main.combo_study_on_validate(Sender: TObject; str: string);
var
  id: integer;
begin
  id := get_id(studies_table_name, studies_study + '=:std', [str], dtm.conn);
  if id > 0 then
  begin
    if not dtm.qry_study.Locate('id', id, []) then
    begin
      dtm.qry_study.Refresh;
      dtm.qry_study.Locate('id', id, []);
    end;
  end
  else
  begin
    if dlg_confirmed(str) then
    begin
      dtm.qry_study.Append;
      dtm.qry_study.FieldByName(studies_study).AsString := str;
      dtm.qry_study.Post;
      dtm.qry_title_parent.Append;
      dtm.qry_title_parent.FieldByName(title_parent_id_parent).AsInteger := 0;
      dtm.qry_title_parent.FieldByName(title_parent_id_title).AsInteger := 0;
      dtm.qry_title_parent.Post;
      dtm.qry_titles.Append;
      dtm.qry_titles.FieldByName(titles_title).AsString := str;
      dtm.qry_titles.Post;
      dtm.qry_title_parent.Edit;
      dtm.qry_title_parent.FieldByName(title_parent_id_title).AsInteger :=
        dtm.qry_titles.FieldByName('id').AsInteger;
      dtm.qry_title_parent.Post;
      dtm.qry_title_parent.Refresh;
    end
    else
    begin
      combo_study.combo.SetFocus;
      ShowMessage('study must has a value');
      abort;
    end;
  end;
  combo_study.refresh;
end;

procedure Tfrm_main.mem_matnExit(Sender: TObject);
var
  dataset: tdataset;
begin
  dataset := TDBMemo(Sender).DataSource.DataSet;
  if dataset.State in [dsinsert, dsedit] then
  begin
    if dataset.FieldByName(topics_topic).IsNull or
      (dataset.FieldByName(topics_topic).AsString = '') then
    begin
      dataset.Cancel;
    end
    else
      dataset.Post;

  end;
end;

function GenerateImageWithRandomColors:tbitmap;
   var
     Bitmap: TBitmap;
     I, J: Integer;
     ColorHEX: string;

   begin
     Bitmap := TBitmap.Create;
     Randomize;

     try
       Bitmap.PixelFormat := pf24bit;
       Bitmap.Width := 100;
       Bitmap.Height := 100;

       for I := 0 to Pred(Bitmap.Width) do
       begin
         for J := 0 to Pred(Bitmap.Height) do
         begin
           Bitmap.Canvas.Pixels[I, J] := RGB(Random(256),
              Random(256),
              Random(256));

           // get the HEX value of color and do something with it
          // ColorHEX := ((Bitmap.Canvas.Pixels[I, J]);
         end;
       end;

       result:=Bitmap;

     finally

     end;
   end;

procedure Tfrm_main.btn_add_titleClick(Sender: TObject);
var
  id_parent, id_title: integer;
begin
  id_title := combo_title.get_current_index();
  if id_title >= 0 then
  begin
    dtm.qry_title_parent.filter := title_parent_id_title + '=' + IntToStr(id_title);
    if dtm.qry_title_parent.FindFirst then
    begin
      ShowMessage('العنوان موجود');
      exit;
    end;
  end;
  if dtm.qry_title_parent.IsEmpty then
    id_parent := 0
  else
    id_parent := dtm.qry_title_parent.FieldByName(title_parent_id_title).AsInteger;

  dtm.qry_title_parent.Append;
  dtm.qry_title_parent.FieldByName(title_parent_id_title).AsInteger := 0;
  dtm.qry_title_parent.FieldByName(title_parent_id_parent).AsInteger := id_parent;
  dtm.qry_title_parent.Post;

  if id_title < 0 then
  begin
    dtm.qry_titles.Append;
    dtm.qry_titles.FieldByName(titles_title).AsString := cmb_title.Text;
    dtm.qry_titles.Post;
    id_title := dtm.qry_titles.FieldByName('id').AsInteger;
    combo_title.refresh;
  end;


  dtm.qry_title_parent.edit;
  dtm.qry_title_parent.FieldByName(title_parent_id_title).AsInteger := id_title;
  dtm.qry_title_parent.post;
  dtm.qry_title_parent.Refresh;
end;

procedure Tfrm_main.cmb_studySelect(Sender: TObject);
begin
  combo_study.on_validate(Sender, cmb_study.Text);
end;

procedure Tfrm_main.cmb_titleEnter(Sender: TObject);
begin
  combo_title.refresh;
end;

procedure Tfrm_main.grd_titlesEnter(Sender: TObject);
begin
  db_nav_sheet_2.DataSource := tdbgrid(Sender).DataSource;
end;

procedure Tfrm_main.mem_matnEnter(Sender: TObject);
begin
  db_nav.DataSource := TDBMemo(Sender).DataSource;
  TDBMemo(Sender).DataSource.DataSet.Edit;
end;

{ Tfrm_main }

end.
