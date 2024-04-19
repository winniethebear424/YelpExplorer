import 'package:ninjafood/app/helper/helper.dart';
import 'package:ninjafood/app/models/comment_model.dart';

final demoDetailProduct =
    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''';

class ProductModel {
  String? name;
  int? id;
  String? uid;
  Image? image;
  SmallImage? smallImage;
  List<MediaGallery>? mediaGallery;
  String? sTypename;
  PriceRange? priceRange;
  Description? description;
  Description? shortDescription;
  List<CommentModel>? comments = [];

  ProductModel(
      {this.name,
      this.id,
      this.uid,
      this.image,
      this.smallImage,
      this.mediaGallery,
      this.sTypename,
      this.priceRange,
      this.description,
      this.comments,
      this.shortDescription});

  String get getPrice =>
      Common.formatMoney(priceRange?.minimumPrice?.finalPrice?.value ?? 0);

  String get currency => priceRange?.minimumPrice?.finalPrice?.currency ?? '';

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    uid = json['uid'];
    comments = json['comments'] != null
        ? (json['comments'] as List)
            .map((i) => CommentModel.fromJson(i))
            .toList()
        : [];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    smallImage = json['small_image'] != null
        ? new SmallImage.fromJson(json['small_image'])
        : null;
    if (json['media_gallery'] != null) {
      mediaGallery = <MediaGallery>[];
      json['media_gallery'].forEach((v) {
        mediaGallery!.add(new MediaGallery.fromJson(v));
      });
    }
    sTypename = json['__typename'];
    priceRange = json['price_range'] != null
        ? new PriceRange.fromJson(json['price_range'])
        : null;
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    shortDescription = json['short_description'] != null
        ? new Description.fromJson(json['short_description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['uid'] = this.uid;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.smallImage != null) {
      data['small_image'] = this.smallImage!.toJson();
    }
    if (this.mediaGallery != null) {
      data['media_gallery'] =
          this.mediaGallery!.map((v) => v.toJson()).toList();
    }
    data['__typename'] = this.sTypename;
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.shortDescription != null) {
      data['short_description'] = this.shortDescription!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ProductModel addComment({required CommentModel comments}) {
    final currentComments = this.comments ?? [];
    final newComments = [...currentComments, comments];
    return ProductModel(
      name: name ?? this.name,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      image: image ?? this.image,
      smallImage: smallImage ?? this.smallImage,
      mediaGallery: mediaGallery ?? this.mediaGallery,
      sTypename: sTypename ?? this.sTypename,
      priceRange: priceRange ?? this.priceRange,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      comments: newComments,
    );
  }

  ProductModel copyWith({
    String? name,
    int? id,
    String? uid,
    Image? image,
    SmallImage? smallImage,
    List<MediaGallery>? mediaGallery,
    String? sTypename,
    PriceRange? priceRange,
    Description? description,
    Description? shortDescription,
    List<CommentModel>? comments,
  }) {
    return ProductModel(
      name: name ?? this.name,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      image: image ?? this.image,
      smallImage: smallImage ?? this.smallImage,
      mediaGallery: mediaGallery ?? this.mediaGallery,
      sTypename: sTypename ?? this.sTypename,
      priceRange: priceRange ?? this.priceRange,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      comments: comments ?? this.comments,
    );
  }

  // For update

  void setPrice(int _value) {
    final finalPrice =
        priceRange?.minimumPrice?.finalPrice?.copyWith(value: _value);
    final minimumPrice =
        priceRange?.minimumPrice?.copyWith(finalPrice: finalPrice);
    priceRange = priceRange?.copyWith(minimumPrice: minimumPrice);
  }

  void setName(String val) => name = val;

  void setDescription(String val) => description = description?.copyWith(content: val);

  void setImage(String urlImage) => image = image?.copyWith(url: urlImage);
}

class Image {
  String? label;
  String? url;
  Null position;
  String? sTypename;

  Image({this.label, this.url, this.position, this.sTypename});

  Image.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    url = json['url'];
    position = json['position'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['url'] = this.url;
    data['position'] = this.position;
    data['__typename'] = this.sTypename;
    return data;
  }

  Image copyWith({
    String? label,
    String? url,
    Null position,
    String? sTypename,
  }) {
    return Image(
      label: label ?? this.label,
      url: url ?? this.url,
      position: position ?? this.position,
      sTypename: sTypename ?? this.sTypename,
    );
  }
}

class SmallImage {
  Null disabled;
  String? label;
  Null position;
  String? url;
  String? sTypename;

  SmallImage(
      {this.disabled, this.label, this.position, this.url, this.sTypename});

  SmallImage.fromJson(Map<String, dynamic> json) {
    disabled = json['disabled'];
    label = json['label'];
    position = json['position'];
    url = json['url'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabled'] = this.disabled;
    data['label'] = this.label;
    data['position'] = this.position;
    data['url'] = this.url;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class MediaGallery {
  String? url;
  Null label;
  int? position;
  String? sTypename;

  MediaGallery({this.url, this.label, this.position, this.sTypename});

  MediaGallery.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    position = json['position'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['position'] = this.position;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class PriceRange {
  MinimumPrice? minimumPrice;
  String? sTypename;

  PriceRange({this.minimumPrice, this.sTypename});

  PriceRange.fromJson(Map<String, dynamic> json) {
    minimumPrice = json['minimum_price'] != null
        ? new MinimumPrice.fromJson(json['minimum_price'])
        : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.minimumPrice != null) {
      data['minimum_price'] = this.minimumPrice!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }

  copyWith({MinimumPrice? minimumPrice}) {
    return PriceRange(
      minimumPrice: minimumPrice ?? this.minimumPrice,
      sTypename: sTypename ?? this.sTypename,
    );
  }
}

class MinimumPrice {
  FinalPrice? finalPrice;
  String? sTypename;

  MinimumPrice({this.finalPrice, this.sTypename});

  MinimumPrice.fromJson(Map<String, dynamic> json) {
    finalPrice = json['final_price'] != null
        ? new FinalPrice.fromJson(json['final_price'])
        : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.finalPrice != null) {
      data['final_price'] = this.finalPrice!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }

  copyWith({FinalPrice? finalPrice}) {
    return MinimumPrice(
      finalPrice: finalPrice ?? this.finalPrice,
      sTypename: sTypename ?? this.sTypename,
    );
  }
}

class FinalPrice {
  String? currency;
  int? value;
  String? sTypename;

  FinalPrice({this.currency, this.value, this.sTypename});

  FinalPrice.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    value = json['value'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['value'] = this.value;
    data['__typename'] = this.sTypename;
    return data;
  }

  copyWith({String? currency, int? value}) {
    return FinalPrice(
      currency: currency ?? this.currency,
      value: value ?? this.value,
      sTypename: sTypename ?? this.sTypename,
    );
  }
}

class Description {
  String? html;
  String? sTypename;
  String? content;

  Description({this.html, this.sTypename, this.content});

  Description.fromJson(Map<String, dynamic> json) {
    html = json['html'];
    content = json['content'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['html'] = this.html;
    data['content'] = this.content;
    data['__typename'] = this.sTypename;
    return data;
  }

  Description copyWith({
    String? html,
    String? sTypename,
    String? content,
  }) {
    return Description(
      html: html ?? this.html,
      sTypename: sTypename ?? this.sTypename,
      content: content ?? this.content,
    );
  }
}
