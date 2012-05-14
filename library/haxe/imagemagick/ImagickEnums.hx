package haxe.imagemagick;

enum CompositeOperator
{
	UndefinedCompositeOp;
	NoCompositeOp;
	AddCompositeOp;
	AtopCompositeOp;
	BlendCompositeOp;
	BumpmapCompositeOp;
	ClearCompositeOp; 
	ColorBurnCompositeOp;
	ColorDodgeCompositeOp;
	ColorizeCompositeOp;
	CopyBlackCompositeOp;
	CopyBlueCompositeOp;
	CopyCompositeOp; 
	CopyCyanCompositeOp;
	CopyGreenCompositeOp;
	CopyMagentaCompositeOp;
	CopyOpacityCompositeOp;
	CopyRedCompositeOp;
	CopyYellowCompositeOp;
	DarkenCompositeOp;
	DstAtopCompositeOp;
	DstCompositeOp;
	DstInCompositeOp;
	DstOutCompositeOp;
	DstOverCompositeOp;
	DifferenceCompositeOp;
	DisplaceCompositeOp;
	DissolveCompositeOp;
	ExclusionCompositeOp;
	HardLightCompositeOp;
	HueCompositeOp;
	InCompositeOp;
	LightenCompositeOp;
	LuminizeCompositeOp;
	MinusCompositeOp;
	ModulateCompositeOp;
	MultiplyCompositeOp;
	OutCompositeOp;
	OverCompositeOp;
	OverlayCompositeOp;
	PlusCompositeOp;
	ReplaceCompositeOp;
	SaturateCompositeOp;
	ScreenCompositeOp;
	SoftLightCompositeOp;
	SrcAtopCompositeOp;
	SrcCompositeOp;
	SrcInCompositeOp;
	SrcOutCompositeOp;
	SrcOverCompositeOp;
	SubtractCompositeOp;
	ThresholdCompositeOp;
	XorCompositeOp;
}

enum NoiseType
{
	UniformNoise;
	GaussianNoise;
	MultiplicativeGaussianNoise;
	ImpulseNoise;
	LaplacianNoise;
	PoissonNoise;
}

enum Operator 
{
	UndefinedEvaluateOperator;
	AddEvaluateOperator;
	AndEvaluateOperator;
	DivideEvaluateOperator;
	LeftShiftEvaluateOperator;
	MaxEvaluateOperator;
	MinEvaluateOperator;
	MultiplyEvaluateOperator;
	OrEvaluateOperator;
	RightShiftEvaluateOperator;
	SetEvaluateOperator;
	SubtractEvaluateOperator;
	XorEvaluateOperator;
}

enum ColorSpace
{	
	UndefinedColorspace;
	RGBColorspace;
	GRAYColorspace;
	TransparentColorspace;
	OHTAColorspace;
	LABColorspace;
	XYZColorspace;
	YCbCrColorspace;
	YCCColorspace;
	YIQColorspace;
	YPbPrColorspace;
	YUVColorspace;
	CMYKColorspace;
	sRGBColorspace;
	HSBColorspace;
	HSLColorspace;
	HWBColorspace;
}

enum Compression
{
	UndefinedCompression;
	NoCompression;
	BZipCompression;
	FaxCompression;
	Group4Compression;
	JPEGCompression;
	LosslessJPEGCompression;
	LZWCompression;
	RLECompression;
	ZipCompression;
}

enum Metric
{
	UndefinedMetric;
	MeanAbsoluteErrorMetric;
	MeanSquaredErrorMetric;
	PeakAbsoluteErrorMetric;
	PeakSignalToNoiseRatioMetric;
	RootMeanSquaredErrorMetric;
}

enum DisposalMethod
{
	UnrecognizedDispose;
	NoneDispose;
	BackgroundDispose;
	PreviousDispose;
}

enum ImageType
{
	UndefinedType;
	BilevelType;
	GrayscaleType;
	GrayscaleMatteType;
	PaletteType;
	PaletteMatteType;
	TrueColorType;
	TrueColorMatteType;
	ColorSeparationType;
	ColorSeparationMatteType;
	OptimizeType;
}

enum Units
{
	UndefinedResolution;
	PixelsPerInchResolution;
	PixelsPerCentimeterResolution;
}

enum Filter
{
	UndefinedFilter;
	PointFilter;
	BoxFilter;
	TriangleFilter;
	HermiteFilter;
	HanningFilter;
	HammingFilter;
	BlackmanFilter;
	GaussianFilter;
	QuadraticFilter;
	CubicFilter;
	CatromFilter;
	MitchellFilter;
	LanczosFilter;
	BesselFilter;
	SincFilter;
}

class ImagickEnums { }
