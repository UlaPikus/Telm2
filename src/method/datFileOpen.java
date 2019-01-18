package method;

import edu.princeton.cs.introcs.BinaryIn; //w kodzie musi sie zawierac biblioteka stdlib-package.jar

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class datFileOpen {

	public static int main(InputStream stream) {
		int out = 0;
		BinaryIn StrumienBinarny = null; // strumien binarny, z ktorego bedziemy czytali po 12 bitow
		int szer = 5000;
		int wys = 4096;

		try {
			StrumienBinarny = new BinaryIn(stream); // opakowujemy zwykly strumien binarny strumieniem binarnym do
													// czytania
			// poszczegolnych bitow

			int czarny = 0;
			int bialy = 16777215;
			int pixel_12_bitowy;
			int nastepny_pixel_12_bitowy;
			int roznica_pixeli;
			int liczba_bitow_w_pixelu = 12;
			int niewazne;

			BufferedImage obrazek = new BufferedImage(szer, wys, BufferedImage.TYPE_INT_RGB); // bufor-obrazek, w ktorym
																								// bedziemy zapisywac
																								// piksele z pliku .dat

			for (int i = 0; i < szer; i++) {// zapelnienie tla kolorem bialym
				for (int j = 0; j < wys; j++) {
					obrazek.setRGB(i, j, bialy);
				}
			}

			pixel_12_bitowy = StrumienBinarny.readInt(liczba_bitow_w_pixelu);
			pixel_12_bitowy = StrumienBinarny.readInt(liczba_bitow_w_pixelu); // w zaleznosci od tego, ktory z dwoch
																				// przebiegow zawartych w .dat chcemy
																				// zawrzec, te linijke zostawiamy
																				// zakomentowana albo nie
			for (int i = 0; i < szer; i++) {
				if (pixel_12_bitowy >= 2048) // ta ten if-else sluzy do przenoszenia przebiegow ekg, znajdujacych sie co
												// do zasady po krawedziach obrazu, na srodek obrazu
				{
					pixel_12_bitowy = pixel_12_bitowy - 2048;
				} else {
					pixel_12_bitowy = pixel_12_bitowy + 2048;
				}
				obrazek.setRGB(i, pixel_12_bitowy, czarny);

				niewazne = StrumienBinarny.readInt(liczba_bitow_w_pixelu); // do czytania pojedynczego zapisu potrzebna
																			// jest co druga porcja 12-bitowa danych,
																			// stad ten pusty, nigdzie niewykorzystywany
																			// potem przeskok
				nastepny_pixel_12_bitowy = StrumienBinarny.readInt(liczba_bitow_w_pixelu);

				if (nastepny_pixel_12_bitowy >= 2048) // kolejny if-else sluzy do przenoszenia przebiegow ekg,
														// znajdujacych sie co do zasady po krawedziach obrazu, na
														// srodek obrazu
				{
					nastepny_pixel_12_bitowy = nastepny_pixel_12_bitowy - 2048;
				} else {
					nastepny_pixel_12_bitowy = nastepny_pixel_12_bitowy + 2048;
				}

				roznica_pixeli = nastepny_pixel_12_bitowy - pixel_12_bitowy;
				if (roznica_pixeli != 0) {
					if (roznica_pixeli > 0) // ten if-else sluzy do rysowania polaczen miedzy punktami wykresu
											// wydobytego z pliku .dat
					{
						for (int j = pixel_12_bitowy; j < nastepny_pixel_12_bitowy; j++) {
							obrazek.setRGB(i, j, czarny);
						}
					} else
						for (int j = nastepny_pixel_12_bitowy; j < pixel_12_bitowy; j++) {
							obrazek.setRGB(i, j, czarny);
						}
				}
				pixel_12_bitowy = nastepny_pixel_12_bitowy;

				if (pixel_12_bitowy >= 2048) // kolejny if-else sluzy do przenoszenia przebiegow ekg, znajdujacych sie
												// co do zasady po krawedziach obrazu, na srodek obrazu
				{
					pixel_12_bitowy = pixel_12_bitowy - 2048;
				} else {
					pixel_12_bitowy = pixel_12_bitowy + 2048;
				}
			}
			ImageIO.write(obrazek, "PNG", new File("D:\\Telm2\\webapp\\img\\ekg.png")); // zapisywanie gotowego obrazka
																						// z bufora do pliku .png
			out = 1;

		} catch (IOException e) {
			e.printStackTrace();
			out = 0;
		}

		try {
			stream.close();

		} catch (IOException e) {
			out = 0;
		}
		return out;
	}
}
