using System;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using InvertedSoftware.ShoppingCart.DataLayer.Dynamic;
using InvertedSoftware.ShoppingCart.BusinessLayer;

public partial class Admin_Upload : System.Web.UI.Page
{
    private string AllowedFiles = ".jpg|.jpeg|.gif|.bmp";
    private int ProductID = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProductID = WebUtility.LoadInt32FromQueryString("ProductID");
        if (ProductID == -1)
            Response.Redirect("Default.aspx");
    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (!ProductFileUpload.HasFile)
            return;
        String fileName = ProductFileUpload.FileName;
        if (!AllowedFiles.Contains(Path.GetExtension(fileName)))
            return;

        String savePath = HttpRuntime.AppDomainAppPath + @"\ProductImages\";
        savePath += fileName;

        ProductFileUpload.SaveAs(savePath);
        //Add to database and get back the ID
        CartDataClassesDataContext context = new CartDataClassesDataContext();
        InvertedSoftware.ShoppingCart.DataLayer.Dynamic.Image image = new InvertedSoftware.ShoppingCart.DataLayer.Dynamic.Image();
        image.ImageName = Path.GetFileName(savePath);
        image.ImageURL = fileName;
        image.ProductID = ProductID;
        image.SortOrder = 1;
        image.Active = true;
        context.Images.InsertOnSubmit(image);
        context.SubmitChanges();


        //Create a thumbnail
        ImageProcessor processor = new ImageProcessor();
        processor.ProcessedImage = (Bitmap)System.Drawing.Image.FromFile(savePath);
        processor.resizeImage(75, 75).Save(HttpRuntime.AppDomainAppPath + @"\ProductImages\" + Path.GetFileNameWithoutExtension(savePath) + "_t" + Path.GetExtension(savePath));
        processor.ProcessedImage.Dispose();
        processor.ProcessedImage = null;
        
        InvertedSoftware.ShoppingCart.DataLayer.Dynamic.Image thumnail = new InvertedSoftware.ShoppingCart.DataLayer.Dynamic.Image();
        thumnail.ParentID = image.ImageID;
        thumnail.ImageName = Path.GetFileNameWithoutExtension(savePath) + "_t";
        thumnail.ImageURL = Path.GetFileNameWithoutExtension(savePath) + "_t" + Path.GetExtension(savePath);
        thumnail.ProductID = ProductID;
        thumnail.SortOrder = 1;
        thumnail.Active = true;
        context.Images.InsertOnSubmit(thumnail);
        context.SubmitChanges();


        MessageLabel.Text = "Your file was saved as " + fileName + " <a href=\"Products/List.aspx\">Go back to Product list</a>";
    }
}
