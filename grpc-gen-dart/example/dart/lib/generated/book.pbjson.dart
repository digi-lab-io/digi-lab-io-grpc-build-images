///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use bookIdDescriptor instead')
const BookId$json = const {
  '1': 'BookId',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `BookId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookIdDescriptor = $convert.base64Decode('CgZCb29rSWQSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use bookDescriptor instead')
const Book$json = const {
  '1': 'Book',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode('CgRCb29rEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGU=');
@$core.Deprecated('Use booksDescriptor instead')
const Books$json = const {
  '1': 'Books',
  '2': const [
    const {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.book.Book', '10': 'books'},
  ],
};

/// Descriptor for `Books`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List booksDescriptor = $convert.base64Decode('CgVCb29rcxIgCgVib29rcxgBIAMoCzIKLmJvb2suQm9va1IFYm9va3M=');
