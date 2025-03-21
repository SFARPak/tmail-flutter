import 'package:equatable/equatable.dart';
import 'package:jmap_dart_client/jmap/identities/identity.dart';
import 'package:jmap_dart_client/jmap/mail/email/email_address.dart';
import 'package:model/email/attachment.dart';

class SavedEmailDraft with EquatableMixin {
  final String content;
  final String subject;
  final Set<EmailAddress> toRecipients;
  final Set<EmailAddress> ccRecipients;
  final Set<EmailAddress> bccRecipients;
  final Set<EmailAddress> replyToRecipients;
  final List<Attachment> attachments;
  final Identity? identity;
  final bool hasReadReceipt;
  final bool isMarkAsImportant;

  SavedEmailDraft({
    required this.content,
    required this.subject,
    required this.toRecipients,
    required this.ccRecipients,
    required this.bccRecipients,
    required this.replyToRecipients,
    required this.attachments,
    required this.identity,
    required this.hasReadReceipt,
    this.isMarkAsImportant = false,
  });

  factory SavedEmailDraft.empty() {
    return SavedEmailDraft(
      subject: '',
      content: '',
      toRecipients: {},
      ccRecipients: {},
      bccRecipients: {},
      replyToRecipients: {},
      attachments: [],
      identity: null,
      hasReadReceipt: false,
    );
  }

  @override
  List<Object?> get props => [
    content,
    subject,
    // Prevent identical Set<EmailAddress>
    {0: toRecipients},
    {1: ccRecipients},
    {2: bccRecipients},
    {3: replyToRecipients},
    attachments,
    identity,
    hasReadReceipt,
    isMarkAsImportant,
  ];
}