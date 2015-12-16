<?xml version="1.0" encoding="UTF-8"?>
<!-- Bicing.xsl version 1-0

Transforma xml proporcionat per OPENDATA Barcelona sobre estacions de bicing i estat a
http://wservice.viabicing.cat/v1/getstations.php?v=1 en format kml compatible Google Maps

Validació amb schema de Google https://developers.google.com/kml/schema/kml22gx.xsd

-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8"></xsl:output>
	<xsl:template match="/">
		<kml xmlns='http://www.opengis.net/kml/2.2'>
			<Document>
				<!-- Schema de les dades de OpenData -->
<!--				<Schema name="OGRGeoJSON" id="OGRGeoJSON">
					<SimpleField name="status" type="string"></SimpleField>
					<SimpleField name="street" type="string"></SimpleField>
					<SimpleField name="nearbyStationList" type="string"></SimpleField>
					<SimpleField name="height" type="string"></SimpleField>
					<SimpleField name="bikes" type="string"></SimpleField>
					<SimpleField name="streetNumber" type="string"></SimpleField>
					<SimpleField name="slots" type="string"></SimpleField>
					<SimpleField name="type" type="string"></SimpleField>
					<SimpleField name="id" type="string"></SimpleField>
				</Schema>
-->			
				<name>Bicing KML</name>
				<xsl:for-each select="/bicing_stations/station">
				<Placemark>
					<name>Bikes : <xsl:value-of select="bikes"/></name>
					<description>Slots : <xsl:value-of select="slots"/></description>
					<!-- Estil en funció del número de bicis disponibles al'estació -->
					<xsl:choose>
						<xsl:when test="status='CLS'">
							<styleUrl>#icon-503-closed</styleUrl>
						</xsl:when>
						<xsl:when test="bikes=bikes+slots">
							<styleUrl>#icon-503-full</styleUrl>
						</xsl:when>
						<xsl:when test="bikes>2*(bikes+slots) div 3">
							<styleUrl>#icon-503-3quart</styleUrl>
						</xsl:when>
						<xsl:when test="bikes>(bikes+slots) div 3">
							<styleUrl>#icon-503-half</styleUrl>
						</xsl:when>
						<xsl:when test="bikes>0">
							<styleUrl>#icon-503-quart</styleUrl>
						</xsl:when>
						<xsl:otherwise>
							<styleUrl>#icon-503-empty</styleUrl>
						</xsl:otherwise>
					</xsl:choose>
<!--					<ExtendedData><SchemaData schemaUrl="#OGRGeoJSON">
						<SimpleData name="status"><xsl:value-of select="status"/></SimpleData>
						<SimpleData name="street"><xsl:value-of select="street"/></SimpleData>
						<SimpleData name="nearbyStationList"><xsl:value-of select="nearbyStationList"/></SimpleData>
						<SimpleData name="height"><xsl:value-of select="height"/></SimpleData>
						<SimpleData name="bikes"><xsl:value-of select="bikes"/></SimpleData>
						<SimpleData name="streetNumber"><xsl:value-of select="streetNumber"/></SimpleData>
						<SimpleData name="slots"><xsl:value-of select="slots"/></SimpleData>
						<SimpleData name="type"><xsl:value-of select="type"/></SimpleData>
						<SimpleData name="id"><xsl:value-of select="id"/></SimpleData>
					</SchemaData></ExtendedData>
-->					<Point>
						<coordinates><xsl:value-of select="concat(long,',',lat)"></xsl:value-of></coordinates>
					</Point>
				</Placemark>
				</xsl:for-each>
			<!-- Estils emprats per estacións en funció del numero de bicis disponibles -->
			<Style id='icon-503-empty-normal'>
				<IconStyle>
					<color>0033ff</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/empty.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'></hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-empty'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-empty-normal</styleUrl>
				</Pair>
			</StyleMap>
			<Style id='icon-503-quart-normal'>
				<IconStyle>
					<color>0033ff</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/quart.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'></hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-quart'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-quart-normal</styleUrl>
				</Pair>
			</StyleMap>
			<Style id='icon-503-half-normal'>
				<IconStyle>
					<color>0099ff</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/half.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'></hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-half'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-half-normal</styleUrl>
				</Pair>
			</StyleMap>
			<Style id='icon-503-3quart-normal'>
				<IconStyle>
					<color>0033ff</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/3quart.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'></hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-3quart'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-3quart-normal</styleUrl>
				</Pair>
			</StyleMap>
			<Style id='icon-503-full-normal'>
				<IconStyle>
					<color>33cc33</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/full.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'>
					</hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-full'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-full-normal</styleUrl>
				</Pair>
			</StyleMap>
			<Style id='icon-503-closed-normal'>
				<IconStyle>
					<color>33cc33</color>
					<Icon>
						<href>http://www.bcn2006.com/Bicing/resources/img/closed.png</href>
					</Icon>
					<hotSpot x='16' y='31' xunits='pixels' yunits='insetPixels'>
					</hotSpot>
				</IconStyle>
			</Style>
			<StyleMap id='icon-503-closed'>
				<Pair>
					<key>normal</key>
					<styleUrl>#icon-503-closed-normal</styleUrl>
				</Pair>
			</StyleMap>
			</Document>
		</kml>
	</xsl:template>

</xsl:stylesheet>