import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polo/core/resourses/app_styles.dart';
import 'package:polo/core/resourses/colors.dart';
import 'package:polo/core/widgets/tab_page_header.dart';
import 'package:polo/Features/Authentication/presentation/widgets/custom_auth_button_.dart';
import 'package:polo/Features/Authentication/presentation/widgets/custom_text_field.dart';

class AddAdView extends StatefulWidget {
  const AddAdView({super.key});

  @override
  State<AddAdView> createState() => _AddAdViewState();
}

class _AddAdViewState extends State<AddAdView> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Pet Animals';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabPageHeader(
                title: 'Add Advertisement',
                subtitle: 'Post your product or service to Pollo Store',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ImagePickerPlaceholder(),
                    SizedBox(height: 24.h),
                    Text('Title', style: AppStyles.bold16),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hint: 'Enter ad title',
                      icon: Icons.title_outlined,
                      controller: _titleController,
                    ),
                    SizedBox(height: 18.h),
                    Text('Category', style: AppStyles.bold16),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.fieldFillColor,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          isExpanded: true,
                          items: const [
                            'Pet Animals',
                            'Large Animals',
                            'Pharmaceutical',
                            'Vet Pharmacy',
                            'Cattle',
                            'Milk',
                            'Baby Chicken',
                          ]
                              .map(
                                (c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(c, style: AppStyles.medium14),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => setState(() => _selectedCategory = v!),
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text('Price (\$)', style: AppStyles.bold16),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hint: '0.00',
                      icon: Icons.attach_money,
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 18.h),
                    Text('Description', style: AppStyles.bold16),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.fieldFillColor,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: 4,
                        style: AppStyles.medium14,
                        decoration: InputDecoration(
                          hintText: 'Describe your product or service...',
                          hintStyle: AppStyles.grey14,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomAuthButton(
                      text: 'Publish Ad',
                      isLoading: _isSubmitting,
                      onTap: _submitAd,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitAd() async {
    if (_titleController.text.isEmpty || _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in title and price'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Advertisement published successfully!'),
        backgroundColor: AppColors.green,
      ),
    );
    _titleController.clear();
    _priceController.clear();
    _descriptionController.clear();
  }
}

class _ImagePickerPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image picker coming soon')),
        );
      },
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.appGradient.createShader(bounds),
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: 48.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Text('Tap to add photos', style: AppStyles.grey14),
          ],
        ),
      ),
    );
  }
}
