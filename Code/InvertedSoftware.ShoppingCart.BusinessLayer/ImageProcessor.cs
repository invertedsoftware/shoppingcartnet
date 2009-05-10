using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace InvertedSoftware.ShoppingCart.BusinessLayer
{
    public class ImageProcessor
    {
        // Typical usage will include cropping the image and then resizing it to 200, 200 to fit as a thumbnail

        private System.Drawing.Bitmap processedImage = null;

        public ImageProcessor()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public System.Drawing.Bitmap cropImage(int x1, int y1, int x2, int y2)
        {
            System.Drawing.Bitmap croppedImage = new Bitmap((x2 - x1), (y2 - y1));
            Graphics newGraphics = Graphics.FromImage(croppedImage);
            newGraphics.SmoothingMode = SmoothingMode.AntiAlias;
            newGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            newGraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

            // Create rectangle for displaying image.
            Rectangle destRect = new Rectangle(0, 0, (x2 - x1), (y2 - y1));

            // Create rectangle for source image.
            Rectangle srcRect = new Rectangle(x1, y1, (x2 - x1), (y2 - y1));

            newGraphics.DrawImage(ProcessedImage, destRect, srcRect, GraphicsUnit.Pixel);
            ProcessedImage.Dispose();
            ProcessedImage = croppedImage;
            return croppedImage;
        }

        public System.Drawing.Bitmap resizeImage(int height, int width)
        {
            Image.GetThumbnailImageAbort myCallback = new Image.GetThumbnailImageAbort(ThumbnailCallback);
            return new Bitmap(ProcessedImage.GetThumbnailImage(width, height, myCallback, IntPtr.Zero));
        }

        public System.Drawing.Bitmap resizeToMaxFitImage(int width)
        {
            // This will resize the image if its over the maximum width

            int tHeight = ProcessedImage.Height;
            int tWidth = ProcessedImage.Width;
            if (tWidth > width)
            {
                int height = Convert.ToInt32((Convert.ToDouble(width) / Convert.ToDouble(tWidth)) * Convert.ToDouble(tHeight));
                return resizeImage(height, width);
            }
            return processedImage;
        }

        public System.Drawing.Bitmap ProcessedImage
        {
            get { return processedImage; }
            set { processedImage = value; }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }
    }
}
