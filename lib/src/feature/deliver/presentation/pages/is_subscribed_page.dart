// ignore_for_file: use_build_context_synchronously

import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:aist_cargo/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Модель для посылки
class PackageOption {
  final String title;
  final String size;
  final String type;

  PackageOption({required this.title, required this.size, required this.type});
}

class IsSubscribedPage extends StatefulWidget {
  const IsSubscribedPage({
    super.key,
    required this.appBar,
    required this.deliverOrSend,
  });

  final String appBar;
  final bool deliverOrSend;

  @override
  State<IsSubscribedPage> createState() => _IsSubscribedPageState();
}

class _IsSubscribedPageState extends State<IsSubscribedPage> {
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

  int selectedCardIndex = -1;
  int selectedSubscriptionIndex = 0;

  final List<PackageOption> packageOptions = [
    PackageOption(
        title: 'Документ/Конверт', type: 'S', size: 'A4 30x21 см до 0.5кг'),
    PackageOption(title: 'Коробка S', type: 'S', size: '55x40x20 см до 10кг'),
    PackageOption(title: 'Коробка M', type: 'M', size: '65x40x25 см до 15кг'),
    PackageOption(title: 'Коробка L', type: 'L', size: '55x40x20 см до 10кг'),
    PackageOption(
        title: 'Сумка/Чемодан S', type: 'S', size: '55x40x20 см до 10кг'),
  ];

  final TextEditingController fromWhereController = TextEditingController();
  final TextEditingController toWhereController = TextEditingController();
  final TextEditingController dispatchController = TextEditingController();
  final TextEditingController arriveController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> cities = [
    'Москва',
    'Ош',
    'Бишкек',
    'Алматы',
    'Санкт-Петербург',
    'Новосибирск',
    'Екатеринбург',
    'Казань',
    'Нижний Новгород',
    'Новокузнецк',
    'Новый Уренгой',
  ];

  String fromQuery = '';
  String toQuery = '';
  List<String> fromFilteredCities = [];
  List<String> toFilteredCities = [];

  @override
  void dispose() {
    fromWhereController.dispose();
    toWhereController.dispose();
    descriptionController.dispose();
    dispatchController.dispose();
    arriveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.appBar),
      body: MultiBlocListener(
        listeners: [
          BlocListener<DeliveryCubit, DeliveryState>(
            listener: (context, state) {
              if (state is DeliverySuccess) {
                Navigator.pushNamed(context, AppRoutes.placeOrder);
              }
              if (state is DeliveryFailure) {
                var snackBar = SnackBar(content: Text(state.message));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                if (state.message == "Подписка жок!") {
                  showSubscriptionBottomSheet(context);
                }
              }
            },
          ),
          BlocListener<SendCubit, SendState>(
            listener: (context, state) {
              if (state is SendSuccess) {
                Navigator.pushNamed(context, AppRoutes.placeOrder);
              }
              if (state is SendFailure) {
                var snackBar = SnackBar(content: Text(state.message));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                if (state.message == "Подписка жок!") {
                  showSubscriptionBottomSheet(context);
                }
              }
            },
          ),
        ],
        child: BlocBuilder<DeliveryCubit, DeliveryState>(
          builder: (context, state) {
            if (state is DeliveryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text('Откуда, куда и когда вы едете?',
                      style: AppTextStyles.f12w600),
                  16.h,
                  TextFieldWidget(
                    controller: fromWhereController,
                    hintText: 'Откуда',
                    onChanged: (value) {
                      setState(() {
                        fromQuery = value;
                        fromFilteredCities = value.isEmpty
                            ? [] // Эгерде текст жок болсо, бош тизме
                            : cities
                                .where((city) => city
                                    .toLowerCase()
                                    .startsWith(fromQuery.toLowerCase()))
                                .toList();
                      });
                    },
                  ),
                  if (fromQuery.isNotEmpty && fromFilteredCities.isNotEmpty)
                    Container(
                      height: fromFilteredCities.length * 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        itemCount: fromFilteredCities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(fromFilteredCities[index]),
                            onTap: () {
                              setState(() {
                                fromWhereController.text =
                                    fromFilteredCities[index];
                                fromQuery = fromFilteredCities[index];
                                fromFilteredCities = [];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  16.h,
                  TextFieldWidget(
                    controller: toWhereController,
                    hintText: 'Куда',
                    onChanged: (value) {
                      setState(() {
                        toQuery = value;
                        toFilteredCities = value.isEmpty
                            ? [] // Эгерде текст жок болсо, бош тизме
                            : cities
                                .where((city) => city
                                    .toLowerCase()
                                    .startsWith(toQuery.toLowerCase()))
                                .toList();
                      });
                    },
                  ),
                  if (toQuery.isNotEmpty && toFilteredCities.isNotEmpty)
                    Container(
                      height: toFilteredCities.length * 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListView.builder(
                        itemCount: toFilteredCities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(toFilteredCities[index]),
                            onTap: () {
                              setState(() {
                                toWhereController.text =
                                    toFilteredCities[index];
                                toQuery = toFilteredCities[index];
                                toFilteredCities = [];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  16.h,
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          onTap: () => _selectDate(context, dispatchController),
                          controller: dispatchController,
                          readOnly: true,
                          hintText: 'Дата вылета',
                          prefixIcon: widget.appBar == 'Самолет'
                              ? const Icon(Icons.flight_takeoff)
                              : const Icon(Icons.calendar_today),
                        ),
                      ),
                      8.w,
                      Expanded(
                        child: TextFieldWidget(
                          onTap: () => _selectDate(context, arriveController),
                          controller: arriveController,
                          readOnly: true,
                          hintText: 'Дата прибытия',
                          prefixIcon: widget.appBar == 'Самолет'
                              ? const Icon(Icons.flight_land)
                              : const Icon(Icons.calendar_month),
                        ),
                      ),
                    ],
                  ),
                  32.h,
                  const Text('Какие посылки вы готовы доставить?',
                      style: AppTextStyles.f12w600),
                  const SizedBox(height: 16),
                  Column(
                    children: List.generate(packageOptions.length, (index) {
                      final package = packageOptions[index];
                      return GestureDetector(
                        onTap: () => setState(() => selectedCardIndex = index),
                        child: _buildProductCard(
                          title: package.title,
                          subtitle: package.size,
                          isSelected: selectedCardIndex == index,
                        ),
                      );
                    }),
                  ),
                  32.h,
                  Text(
                    'Допольнительная информация о поездке!',
                    style: AppTextStyles.f12w400.copyWith(
                      color: AppColors.greyBrightColor,
                    ),
                  ),
                  8.h,
                  TextFormField(
                    controller: descriptionController,
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
                  32.h,
                  widget.deliverOrSend == true
                      ? BlocBuilder<DeliveryCubit, DeliveryState>(
                          builder: (context, state) {
                            if (state is DeliveryLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return ElevatedButtonWidget(
                                title: 'Создать поездку',
                                onPressed: () async {
                                  final userCubit = context.read<UserCubit>();

                                  if (userCubit.state is! UserSuccess) {
                                    userCubit.getUserData();
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                  }

                                  final userState =
                                      context.read<UserCubit>().state;

                                  if (userState is! UserSuccess) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Колдонуучу маалыматы жүктөлө элек!'),
                                      ),
                                    );
                                    return;
                                  }

                                  final user = (userState).user;
                                  String fullName =
                                      '${user.firstName} ${user.lastName}';

                                  context
                                      .read<DeliveryCubit>()
                                      .createDeliveries(
                                        CreateDeliveryModel(
                                          fromWhere: fromWhereController.text,
                                          toWhere: toWhereController.text,
                                          dispatchDate: dispatchController.text,
                                          arrivalDate: arriveController.text,
                                          description:
                                              descriptionController.text,
                                          fullName: fullName,
                                          transportNumber: "AC202F",
                                          transportType: widget.appBar ==
                                                  'Самолет'
                                              ? "AIRPLANE"
                                              : widget.appBar == 'Автомобиль'
                                                  ? "CAR"
                                                  : "TRUCK",
                                          packageType: "LUGGAGE",
                                          truckSize: "SMALL",
                                          size:
                                              packageOptions[selectedCardIndex]
                                                  .type,
                                          role: "DELIVERY",
                                        ),
                                      );

                                  context
                                      .read<DeliveryCubit>()
                                      .updateDeliveryInfo(
                                        fromWhere: fromWhereController.text,
                                        toWhere: toWhereController.text,
                                        dispatchDate: dispatchController.text,
                                        arrivalDate: arriveController.text,
                                        description: descriptionController.text,
                                      );
                                });
                          },
                        )
                      : BlocBuilder<SendCubit, SendState>(
                          builder: (context, state) {
                            if (state is SendLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return ElevatedButtonWidget(
                              title: 'Создать поездку',
                              onPressed: () async {
                                context.read<SendCubit>().createSend(
                                      SendModel(
                                        fromWhere: fromWhereController.text,
                                        toWhere: toWhereController.text,
                                        dispatchDate: dispatchController.text,
                                        arrivalDate: arriveController.text,
                                        description: descriptionController.text,
                                        firstName: 'Marat',
                                        lastName: 'Kubatov',
                                        packageType: 'LUGGAGE',
                                        size: packageOptions[selectedCardIndex]
                                            .type,
                                        subsDuration: 'ONE_MONTH',
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                  32.h,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(
      {required String title,
      required String subtitle,
      required bool isSelected}) {
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

  void showSubscriptionBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return BlocListener<DeliveryCubit, DeliveryState>(
          listener: (context, state) {
            if (state is DeliverySuccess) {
              Navigator.pushNamed(context, AppRoutes.placeOrder);
            }
            if (state is DeliveryFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Подписка кылууда ката кетти'),
              ));
            }
          },
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              int localSelectedSubscriptionIndex = selectedSubscriptionIndex;

              return FractionallySizedBox(
                heightFactor: 0.7,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      30.h,
                      Text(
                        'Чтобы открыть следующую страницу, необходимо подписаться на один из тарифов.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.f14w400
                            .copyWith(color: AppColors.textColor),
                      ),
                      24.h,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SubscriptionButton(
                              text: 'Подключить за 99Р на 1 месяц',
                              color: AppColors.subscribeYellowColor,
                              index: 1,
                              currentIndex: localSelectedSubscriptionIndex,
                              onSelect: (index) {
                                setModalState(() {
                                  localSelectedSubscriptionIndex = index;
                                });
                                setState(() {
                                  selectedSubscriptionIndex = index;
                                });
                              },
                            ),
                            8.h,
                            SubscriptionButton(
                              text: 'Подключить за 999Р на 3 месяца',
                              color: AppColors.subscribeBlueColor,
                              index: 2,
                              currentIndex: localSelectedSubscriptionIndex,
                              onSelect: (index) {
                                setModalState(() {
                                  localSelectedSubscriptionIndex = index;
                                });
                                setState(() {
                                  selectedSubscriptionIndex = index;
                                });
                              },
                            ),
                            8.h,
                            SubscriptionButton(
                              text: 'Подключить за 9990Р на 6 месяца',
                              color: AppColors.subscribeRedColor,
                              index: 3,
                              currentIndex: localSelectedSubscriptionIndex,
                              onSelect: (index) {
                                setModalState(() {
                                  localSelectedSubscriptionIndex = index;
                                });
                                setState(() {
                                  selectedSubscriptionIndex = index;
                                });
                              },
                            ),
                            8.h,
                            SubscriptionButton(
                              text: 'Подключить за 99900Р на 12 месяца',
                              color: AppColors.subscribeGreenColor,
                              index: 4,
                              currentIndex: localSelectedSubscriptionIndex,
                              onSelect: (index) {
                                setModalState(() {
                                  localSelectedSubscriptionIndex = index;
                                });
                                setState(() {
                                  selectedSubscriptionIndex = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      24.h,
                      ElevatedButtonWidget(
                        title: 'Подключить',
                        onPressed: () async {
                          // Navigator.pushNamed(context, AppRoutes.addCard);

                          context.read<DeliveryCubit>().createSubscription(
                                localSelectedSubscriptionIndex == 1
                                    ? 'ONE_MONTH'
                                    : localSelectedSubscriptionIndex == 2
                                        ? 'THREE_MONTH'
                                        : localSelectedSubscriptionIndex == 3
                                            ? 'SIX_MONTH'
                                            : '',
                                'AIRPLANE',
                              );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
