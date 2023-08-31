import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/community/community_chat/community_chat_view.dart';
import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:ayura/provider/models/community_model.dart';
import 'package:ayura/provider/models/memberModel.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/community/member_card.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMember extends StatefulWidget {
  final String communityId;
  AddMember({required this.communityId});
  @override
  _AddMemberState createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommunityProvider>(context, listen: false)
        .getMembersList(widget.communityId);
  }

  TextEditingController _emailController = TextEditingController();
  List<String> _membersList = [];

  void _addMember(String communityId) async {
    String newMember = _emailController.text.trim();
    if (newMember.isNotEmpty && !_membersList.contains(newMember)) {
      try {
        await Provider.of<CommunityProvider>(context, listen: false)
            .addMember(communityId, newMember);
        _membersList.add(newMember);
        _emailController.clear();
        await Provider.of<CommunityProvider>(context, listen: false)
            .getMembersList(widget.communityId);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Member Added')));

        setState(() {});
      } catch (e) {
        // Handle error, e.g., display a snackbar with an error message
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User not Found')));
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        Icons.arrow_back,
        Icons.more_vert,
        'Add Members',
        leftCallback: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 1.0),
                  ),
                  labelText: 'Add Member by Email',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: (() => _addMember(widget.communityId)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Members List',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: height * 0.6,
                //When I add a member it should go to the database and display in here realtime
                child: Consumer<CommunityProvider>(
                    builder: (context, communityProvider, _) {
                  List<MemberModel> members = communityProvider.memberList;
                  return ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        MemberModel member = members[index];
                        return MemberCard(
                          memberName: member.firstName + ' ' + member.lastName,
                          memberMail: member.email,
                        );
                      });
                }),
              ),
              const SizedBox(height: 16),
              customButton(
                  tap: (() {
                    Navigator.pop(context);
                  }),
                  width: MediaQuery.of(context).size.width * 0.4,
                  text: 'Save',
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
