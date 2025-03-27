import 'package:aist_cargo/src/core/core.dart';
import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({
    super.key,
    required this.packageOptions,
    required this.deliverOrSend,
  });

  final List<PackageOption> packageOptions;
  final bool deliverOrSend;

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  late final TextEditingController _fullNameController;
  // late final TextEditingController _phoneController;
  late final TextEditingController _fromWhereController;
  late final TextEditingController _toWhereController;
  late final TextEditingController _dispatchDateController;
  late final TextEditingController _arrivalDateController;
  late final TextEditingController _descriptionController;

  final _formKey = GlobalKey<FormState>();

  // Добавляем флаги валидации
  bool _isFormValidated = false;
  String? _fromWhereError;
  String? _toWhereError;
  String? _dispatchDateError;
  String? _arrivalDateError;
  String? _packageError;
  String? _fullNameError;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<DeliveryCubit>();
    _fullNameController = TextEditingController();
    // _phoneController = TextEditingController();
    _fromWhereController = TextEditingController(text: cubit.fromWhere);
    _toWhereController = TextEditingController(text: cubit.toWhere);
    _dispatchDateController = TextEditingController(text: cubit.dispatchDate);
    _arrivalDateController = TextEditingController(text: cubit.arrivalDate);
    _descriptionController = TextEditingController(text: cubit.description);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    // _phoneController.dispose();
    _fromWhereController.dispose();
    _toWhereController.dispose();
    _dispatchDateController.dispose();
    _arrivalDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";

      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deliveryCubit = context.read<DeliveryCubit>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Создать поездку'),
      body: MultiBlocListener(
        listeners: [
          widget.deliverOrSend == true
              ? BlocListener<DeliveryCubit, DeliveryState>(
                  listener: (context, state) {
                    if (state is DeliveryFailure) {
                      var snackBar = SnackBar(content: Text(state.message));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is DeliverySuccess) {
                      final orderNumber = state.deliveries["random"];
                      _showSubscriptionBottomSheet(
                        context,
                        orderNumber ?? 0,
                      );
                    }
                  },
                )
              : BlocListener<SendCubit, SendState>(
                  listener: (context, state) {
                    if (state is SendFailure) {
                      var snackBar = SnackBar(content: Text(state.message));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is SendSuccess) {
                      final orderNumber = state.send["random"];
                      _showSubscriptionBottomSheet(
                        context,
                        orderNumber ?? 0,
                      );
                    }
                  },
                ),
        ],
        child: Form(
          key: _formKey,
          autovalidateMode: _isFormValidated
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                30.h,
                CityAutocomplete(
                  title: 'Откуда',
                  initialValue: _fromWhereController.text,
                  onSelected: (city) {
                    _fromWhereController.text = city;
                    widget.deliverOrSend == true
                        ? context.read<DeliveryCubit>().fromWhere = city
                        : context.read<SendCubit>().fromWhere = city;
                  },
                  errorText: _fromWhereError,
                ),
                20.h,
                CityAutocomplete(
                  title: 'Куда',
                  initialValue: _toWhereController.text,
                  onSelected: (city) {
                    _toWhereController.text = city;
                    widget.deliverOrSend == true
                        ? context.read<DeliveryCubit>().toWhere = city
                        : context.read<SendCubit>().toWhere = city;
                  },
                  errorText: _toWhereError,
                ),
                20.h,
                TextFieldWithTitle(
                  onTap: () => _selectDate(context, _dispatchDateController),
                  backgroundColor: Colors.transparent,
                  controller: _dispatchDateController,
                  title: 'Дата вылета',
                  hintText: '',
                  isRead: true,
                  onChanged: (value) {
                    widget.deliverOrSend == true
                        ? context.read<DeliveryCubit>().dispatchDate = value
                        : context.read<SendCubit>().dispatchDate = value;
                  },
                  errorText: _dispatchDateError,
                ),
                20.h,
                TextFieldWithTitle(
                  onTap: () => _selectDate(context, _arrivalDateController),
                  backgroundColor: Colors.transparent,
                  controller: _arrivalDateController,
                  title: 'Дата прилета',
                  hintText: '',
                  isRead: true,
                  onChanged: (value) {
                    widget.deliverOrSend == true
                        ? context.read<DeliveryCubit>().arrivalDate = value
                        : context.read<SendCubit>().arrivalDate = value;
                  },
                  errorText: _arrivalDateError,
                ),
                20.h,
                TextFieldWithTitle(
                  controller: _fullNameController,
                  backgroundColor: Colors.transparent,
                  title: 'ФИО',
                  hintText: 'Нап: Асан Асанов',
                  errorText: _fullNameError,
                ),
                // 20.h,
                // const TextFieldWithTitle(
                //   title: 'Номер телефона',
                //   hintText: 'Номер телефона',
                // ),
                20.h,
                const Text(
                  'Какие посылки вы готовы доставить?',
                  style: AppTextStyles.f12w600,
                ),
                16.h,
                if (_packageError != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _packageError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Column(
                  children:
                      List.generate(widget.packageOptions.length, (index) {
                    final package = widget.packageOptions[index];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => deliveryCubit.boxType = index),
                      child: _buildProductCard(
                        type: package.type,
                        title: package.title,
                        subtitle: package.size,
                        isSelected: deliveryCubit.boxType == index,
                      ),
                    );
                  }),
                ),
                32.h,
                Text(
                  'Допольнительная информация о поездке',
                  style: AppTextStyles.f12w400.copyWith(
                    color: AppColors.greyBrightColor,
                  ),
                ),
                8.h,
                TextFormField(
                  initialValue: deliveryCubit.description,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Я даю гарантию безопасную транспортировку.',
                    hintStyle: AppTextStyles.f12w400
                        .copyWith(color: AppColors.textColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.blackColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.blackColor,
                        width: 1,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  maxLines: null,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                31.h,
                BlocBuilder<DeliveryCubit, DeliveryState>(
                  builder: (context, state) {
                    if (state is DeliveryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButtonWidget(
                      title: 'Оформить',
                      onPressed: () async {
                        setState(() {
                          _isFormValidated = true;
                          _fromWhereError = FormValidators.validateCity(
                              _fromWhereController.text);
                          _toWhereError = FormValidators.validateCity(
                              _toWhereController.text);
                          _dispatchDateError = FormValidators.validateDate(
                              _dispatchDateController.text);
                          _arrivalDateError = FormValidators.validateDate(
                              _arrivalDateController.text);
                          _packageError =
                              FormValidators.validatePackageSelection(
                                  deliveryCubit.boxType);
                          _fullNameError = FormValidators.validatefullName(
                              _fullNameController.text);
                        });

                        if (_formKey.currentState!.validate() &&
                            _packageError == null &&
                            _fromWhereError == null &&
                            _toWhereError == null &&
                            _dispatchDateError == null &&
                            _arrivalDateError == null &&
                            _fullNameError == null) {
                          context
                              .read<DeliveryCubit>()
                              .createDelivery(CreateDeliveryModel(
                                userName: _fullNameController.text,
                                fromWhere: _fromWhereController.text,
                                toWhere: _toWhereController.text,
                                dispatchDate: _dispatchDateController.text,
                                arrivalDate: _arrivalDateController.text,
                                size: widget
                                    .packageOptions[deliveryCubit.boxType].type,
                                transportNumber: 'AWC123F',
                              ));
                        }
                      },
                    );
                  },
                ),
                32.h,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required String type,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent, width: 2),
      ),
      child: ListTile(
        title: Text(title, style: AppTextStyles.f12w600),
        subtitle: Text(subtitle, style: AppTextStyles.f10w400),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.orange)
            : null,
      ),
    );
  }

  void _showSubscriptionBottomSheet(BuildContext context, int orderNumber) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Text(
                  'Поездка (номер генерируется автоматически)',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f10w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                8.h,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(
                              double.infinity,
                              60,
                            ),
                            side: const BorderSide(
                                color: AppColors.greyBrightColor),
                          ),
                          child: Text(
                            '$orderNumber',
                            style: AppTextStyles.f20w500.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                24.h,
                Text(
                  'Спасибо!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f24w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                24.h,
                Text(
                  'Ваша поездка успешно обработана!',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f18w400.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                const Spacer(flex: 2),
                ElevatedButtonWidget(
                  title: 'Ок',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.main,
                    (route) => false,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
