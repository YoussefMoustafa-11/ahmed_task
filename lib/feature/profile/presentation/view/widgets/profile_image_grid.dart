import 'package:flutter/material.dart';
import '../../../../../Core/themes/app_color.dart';

class ProfileImageGrid extends StatelessWidget {
  final List<String> imageUrls;

  const ProfileImageGrid({
    super.key,
    this.imageUrls = const [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAB-iOu-c59YcmSydC1Rpvazusssu3mmjEPcLGHycj-bmYMRTS3qc4VTw5WFlldHXv8fXXkZs1R-JGP5vRxZPucUm4_FaVo51Wi8_bgKvLE7jOmUU45dMzhhBXvZkfPbLXEDeNL3YyC0T4sWPGtdsAGc4p8yYtH9ZMjdEwjpAQi6Mr8C3rno03JBibUanJ63JQHV8eUaN7ugz1wVXH8BbeH-4kE6NOfvC6eEIMfQjUdV5qnMPKAri425_WK5ialxfRmyFCQIt8h5uI',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuA2cxQfRrGP_vG1TTFngh7Ngg-46nNEXIqSqv10HLkDRsAhYDxUzRoGN6AoBFMQq6ZHbF3mOoIN1tWCV-epWjR_usd85r3O8VeVEpOQ__i42DEv0dWbcMADMQ3wkMRS0eIMfK9luZgpov2EL5pSPgbDmVULJDmo7K3EEtBBeB221PIwAkW2kgRGq3BYYzyytu2gZVWHdTXrpiC23EqrohCsOIKqCsHQwUoLEhJi_EzjHnsBo-sL2W6MuDqsc_9ZE7Jwe3mp2cn6KoM',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAx2Hy38ADAvWIkiPwHIx4Gz8NtzVPi0xZoRjPZlaERQmU1sZjmvu_UeHQ7gRVbjViRQAoV4nSQmxH5fRfNDhS0icDcAz1F6RsD01Tj0Q0fWg_gMaF5cEsCmFz9oeFombvxtCzWSHnvKSXDM_vJyhyoSN_jBK4_Fmw1_DtBQoeUIbtpUaIc34nEe8HZgee1nycyR0XpBIeyiblKcDBK856tQcLpp4c1syfbm62ltH2W9aiN_fiqfAjAl-Z2BNTEV-cy2Cfu4Z23Kgc',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBPAb25x0XiAgFDkV5R8J0R_zBl2C7CniIjp2KpMNVhItVbm0RGEE2GtfzzUIDAU35zCTGie5CuuRS3tguTP55vOp7dc6hQ_rN0AJg93t8EZjzejv63kZOvFGRNpLMY6fyRkqKtWiZgf-C4xjLGkrujW7clDyz_Ezqx8QuqmOT5MRrPZQbAkZ9cxUoTBYIitbvHnrbbOwSH9SU2ihJYGdEpq9DnYEvoWhD092iD8TGVV1KELjrC3GhHKIkLzMU7eBv8tT8gOBXR4_M',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBUoq8VUDVPTpBQhEe-8K7uOrxTfmJ7p1QjbwT8rJekIq7WBKXF2L0yhEBkH9anIc8LbYB_lC23E-fg1sfNKF4JeIfpOyBr5tLWtsrPag7XZB18dbzydTUnPZaLJqv5EZbHm-cdcV6ceD2JbNn1ZpMxA5QJprW80ibbcBg8N0YizcpjlT5GcjHVQ4_KCg33tYgyf6KYiPtFvgWLZPqrbBVmCir6JASo1-jckw-MKF2SsO9m2mnrD1cMhLE1Ofow1OPQXOzNKjdnOpA',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDPupkdj_RBDsqfdf91ePq-JcJFAAPr8XiEKlZTZf9ARIxpSz0JRJsTTm57ziknrygJZstQ4ojT20z6UiYNIfDdm5Vsq2nXzqgQR2gBQ0IQk1uop8EvprDZdbyk1T6Wu6ehOSwz13ZNYQGoR3VWdIHcXRmVmdR9LEm9zDxN-SjIBSy56dtqRDMY8zpxeYrUjRi2U1vDAGvBXFpllUDATgCQK5yw3ulePzfB03RTncn_VbOBk5Z2HMcozzDfUjlzUpbSvUWiL2I1zXI',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDN9j_HOIPW1vx9vHxwDpResLPPyq94jisM72DbeMplAg-Y7Dn4Dix2FZMjdENEcDW2bnKs3wazyFZLh2CIMSaxV7FEnhDDlijcJQqIwnRxHu_uvmms4nI3HufcTpqIVYOZAGlQtCoz9F3Z0Y10ppwRfCS--oqSicuspkezt7iO9t03BkZkTAmpHfFGg8O02ZniI5rrEncLqsdsaZ4ZYGWslPAs8LIVSw_L38ByjYE1FH6jalgDcOBGrqmlPYBGvh7IQxgGJLwZX4c',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBH09FtxtxQWFtOM1yX5kC3VEUNW3ZC74e9A19Xj50WfUAKYHACOjPW0vvPTDk-SCKKElM344OfGWO3j7dyCsz6BL-G2KuLV3Gt9V4fIc9GAtjjlgmgsYRaxezN4QDB_uIXQ7uTOmkYyDhfQkalJWiSemXMYlEf5JwbYHs5o5Begyjf2pzK6QOoJ-6wsqlt6PtQDSzPA_mowKX0Mgs7ZmU3murP8m0BQigC8mVQ6Ji2HIiYm_K5Jjy4LiMw_9hpq-TM2W01rzULD1k',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD7mzzrevEiPaEs26xxsdYA2V7lAli3VCl1PyM36HJhncO4vymw9gQ2TFNn05LSh65EJZMvePInCmhUINLNq5_MnKKaJ1JxAIxGNMnmsRnsTVULPKF6M7Rb7PKJy8uK09BiBkbEeeffdWF0GbNPT34iz4o93qsdWzJkWxywDb2xMfJkNIRzP4eGvNBxiulY-NAibgIEJ_EOKSQm_DYN2lABPLe6Avsq54JTUmTOujte0uEvEp14no1f0oU_R7fpjKZnn_qP7k10r9c',
    ],
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return _ImageGridItem(
          imageUrl: imageUrls[index],
          isMultiMediaItem: index == 5,
        );
      },
    );
  }
}

class _ImageGridItem extends StatelessWidget {
  final String imageUrl;
  final bool isMultiMediaItem;

  const _ImageGridItem({required this.imageUrl, this.isMultiMediaItem = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.borderColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: AppColors.borderColor);
            },
          ),
          if (isMultiMediaItem)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.collections, color: Colors.white, size: 20),
            ),
        ],
      ),
    );
  }
}
