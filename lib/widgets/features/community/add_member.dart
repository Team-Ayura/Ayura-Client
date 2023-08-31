import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:ayura/provider/models/memberModel.dart';
import 'package:ayura/widgets/features/community/member_card.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMember extends StatefulWidget {
  final String communityId;
  const AddMember({super.key, required this.communityId});
  @override
  AddMemberState createState() => AddMemberState();
}

class AddMemberState extends State<AddMember> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommunityProvider>(context, listen: false)
        .getMembersList(widget.communityId);
  }

  final TextEditingController _emailController = TextEditingController();
  final List<String> _membersList = [];

  void _addMember(String communityId) async {
    String newMember = _emailController.text.trim();
    if (newMember.isNotEmpty && !_membersList.contains(newMember)) {
      try {
        final communityProvider =
            Provider.of<CommunityProvider>(context, listen: false);
        // Add the new member to the community
        await communityProvider.addMember(communityId, newMember);
        // Update the local list of members
        setState(() {
          _membersList.add(newMember);
        });
        // Clear the email controller
        _emailController.clear();
        // Fetch updated member list from the provider
        await communityProvider.getMembersList(widget.communityId);
        // Show a snackbar to indicate successful addition
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Member Added')));
      } catch (error) {
        // Handle any errors that occur during the process
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User not found')));
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
                          memberName: '${member.firstName} ${member.lastName}',
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
